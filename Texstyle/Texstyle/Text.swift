//
// Copyright (c) 2019 Rosberry. All rights reserved.
//

import UIKit

/// Stores string, styles and substyles for attributed string.
public final class Text: BaseText {

    public let value: String
    public let style: TextStyle

    /// Returns attributed string.
    public var attributed: NSAttributedString {
        let attributes = style.attributes
        if let cachedAttributedString = self.cachedAttributedString {
            return cachedAttributedString
        }
        let attributedString = NSMutableAttributedString(string: value, attributes: attributes)

        for substyle in substyles {
            attributedString.addAttributes(substyle.style.attributes, range: substyle.range)
        }

        cachedAttributedString = attributedString
        return attributedString
    }

    /// Returns array of added substyles
    var substyles: [TextSubstyle] = [] {
        didSet {
            cachedAttributedString = nil
        }
    }

    private var cachedAttributedString: NSAttributedString?

    /// Initialize the text with passed string and style.
    ///
    /// - Parameters:
    ///   - value: The string for style and substyles.
    ///   - style: The style for passed string.
    public init(value: String, style: TextStyle) {
        self.value = value
        self.style = style
    }

    /// Initialize the text with passed string and style. Returns nil if there is no value.
    ///
    /// - Parameters:
    ///   - value: The string for style and substyles.
    ///   - style: The style for passed string.
    public convenience init?(value: String?, style: TextStyle) {
        if let value = value {
            self.init(value: value, style: style)
        }
        else {
            return nil
        }
    }

    /// Returns a new text by concatenating the passed text.
    /// - Parameter text: The text for concatenation.
    public func concat(_ text: Text) -> Text {
        let newText = Text(value: value + text.value, style: style)
        newText.substyles = substyles

        let range = NSRange(location: value.count, length: text.value.count)
        let substyle = TextSubstyle(style: text.style, range: range)
        newText.substyles.append(substyle)

        let rhsSubstyles = text.substyles.map { substyle -> TextSubstyle in
            let range = NSRange(location: value.count + substyle.range.location, length: substyle.range.length)
            return TextSubstyle(style: substyle.style, range: range)
        }
        newText.substyles.append(contentsOf: rhsSubstyles)

        return newText
    }

    /// Adds the substyle for passed range.
    ///
    /// - Parameters:
    ///   - substyle: The substyle for passed range.
    ///   - range: The range for substyle applying.
    public func add(_ substyle: TextStyle, at range: Range<String.Index>) {
        add(substyle, at: .init(range, in: value))
    }

    /// Adds the substyle for passed range.
    ///
    /// - Parameters:
    ///   - substyle: The substyle for passed range.
    ///   - range: The range for substyle applying.
    public func add(_ substyle: TextStyle, at range: NSRange) {
        substyles.append(.init(style: substyle, range: range))
    }

    /// Convenient method for adding the substyle for substring.
    /// This method finds all occurrences of string in text
    /// and applies the substyle to it.
    ///
    /// - Parameters:
    ///   - substyle: The substyle for passed string.
    ///   - substring: The string value.
    public func add(_ substyle: TextStyle, for substring: String) {
        var searchStartIndex = value.startIndex
        let endIndex = value.endIndex

        while searchStartIndex < endIndex,
              let range = value.range(of: substring, range: searchStartIndex..<endIndex),
              !range.isEmpty {
            add(substyle, at: range)
            searchStartIndex = range.upperBound
        }
    }

    ///Returns the bounding rectangle required to draw the string.
    ///
    /// - Parameters:
    ///   - size: The width and height constraints to apply when computing the string’s bounding rectangle.
    ///   - options: Additional drawing options to apply to the string during rendering.
    ///   - context: A context object with information about how to adjust the font tracking and scaling information.
    /// On return, the specified object contains information about the actual values used to render the string.
    /// This parameter is nil by default.
    /// - Returns: A rectangle which size component indicates the width and height required to draw the entire contents of the string.
    public func boundingRect(with size: CGSize,
                             options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading],
                             context: NSStringDrawingContext? = nil) -> CGRect {
        return attributed.boundingRect(with: size, options: options, context: context)
    }

    public func copy() -> Text {
        let copy = Text(value: value, style: style.copy())
        copy.substyles = substyles.copy()
        return copy
    }
}

// MARK: - Equatable

extension Text: Equatable {

    public static func == (lhs: Text, rhs: Text) -> Bool {
        lhs.value == rhs.value && lhs.style == rhs.style
    }
}
