//
// Copyright (c) 2019 Rosberry. All rights reserved.
//

import UIKit

/// Stores string, styles and substyles for attributed string.
public final class Text {

    public let value: String
    public let styles: [ControlState: TextStyle]

    /// Returns attributed string for normal state.
    public var attributed: NSAttributedString? {
        return attributed()
    }

    /// Clears cached attributed string.
    var substyles: [TextSubstyle] = [] {
        didSet {
            cachedAttributedStrings.removeAll()
        }
    }
    private var cachedAttributedStrings: [ControlState: NSAttributedString] = [:]

    /// Initialize the text with passed string and style for normal state.
    ///
    /// - Parameters:
    ///   - value: The string for style and substyles.
    ///   - substyle: The style for passed string.
    public init(value: String, style: TextStyle) {
        self.value = value
        self.styles = [.normal: style]
    }

    /// Initialize the text with passed string and style for normal state. Returns nil if there is no value.
    ///
    /// - Parameters:
    ///   - value: The string for style and substyles.
    ///   - substyle: The style for passed string.
    public convenience init?(value: String?, style: TextStyle) {
        if let value = value {
            self.init(value: value, style: style)
        }
        else {
            return nil
        }
    }

    /// Initialize the text with passed string and styles for appropriate states.
    ///
    /// - Parameters:
    ///   - value: The string for style and substyles.
    ///   - styles: The dictionary with states and text styles.
    public init(value: String, styles: [ControlState: TextStyle]) {
        self.value = value
        self.styles = styles
    }

    /// Initialize the text with passed string and styles for appropriate states. Returns nil if there is no value.
    ///
    /// - Parameters:
    ///   - value: The string for style and substyles.
    ///   - styles: The dictionary with states and text styles.
    public convenience init?(value: String?, styles: [ControlState: TextStyle]) {
        if let value = value {
            self.init(value: value, styles: styles)
        }
        else {
            return nil
        }
    }

    /// Adds the substyle for passed range.
    ///
    /// - Parameters:
    ///   - substyle: The substyle for passed range.
    ///   - range: The range for substyle applying.
    ///   - state: The state for passed substyle. Default is normal.
    public func add(_ substyle: TextStyle, at range: Range<String.Index>, for state: ControlState = .normal) {
        add(substyle, at: .init(range, in: value), for: state)
    }

    /// Adds the substyle for passed range.
    ///
    /// - Parameters:
    ///   - substyle: The substyle for passed range.
    ///   - range: The range for substyle applying.
    ///   - state: The state for passed substyle. Default is normal.
    public func add(_ substyle: TextStyle, at range: NSRange, for state: ControlState = .normal) {
        substyles.append(.init(style: substyle, range: range, state: state))
    }

    /// Convenient method for adding the substyle for substring.
    /// This method finds all occurrences of string in text
    /// and applies the substyle to it.
    ///
    /// - Parameters:
    ///   - substyle: The substyle for passed string.
    ///   - substring: The string value.
    ///   - state: The state for passed substyle. Default is normal.
    public func add(_ substyle: TextStyle, for substring: String, for state: ControlState = .normal) {
        var searchStartIndex = value.startIndex
        let endIndex = value.endIndex

        while searchStartIndex < endIndex,
              let range = value.range(of: substring, range: searchStartIndex..<endIndex),
              !range.isEmpty {
            add(substyle, at: range, for: state)
            searchStartIndex = range.upperBound
        }
    }

    /// Applies all attributes from style and substyles.
    ///
    /// - Parameter state: The state for passed substyle. Default is normal.
    /// - Returns: If there is no attributes for the state it returns nil. If the attributed string is cached it returns cached string.
    public func attributed(for state: ControlState = .normal) -> NSAttributedString? {
        guard let attributes = styles[state]?.attributes else {
            return nil
        }

        if let cachedAttributedString = cachedAttributedStrings[state] {
            return cachedAttributedString
        }

        let attributedString = NSMutableAttributedString(string: value, attributes: attributes)

        for substyle in substyles where substyle.state == state {
            attributedString.addAttributes(substyle.style.attributes, range: substyle.range)
        }

        cachedAttributedStrings[state] = attributedString
        return attributedString
    }

    ///Returns the bounding rectangle required to draw the string.
    ///
    /// - Parameters:
    ///   - size: The width and height constraints to apply when computing the string’s bounding rectangle.
    ///   - options: Additional drawing options to apply to the string during rendering.
    ///   - context: A context object with information about how to adjust the font tracking and scaling information.
    /// On return, the specified object contains information about the actual values used to render the string.
    /// This parameter is nil by default.
    ///   - state: The control state for attributes.
    /// - Returns: A rectangle which size component indicates the width and height required to draw the entire contents of the string.
    public func boundingRect(with size: CGSize,
                             options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading],
                             context: NSStringDrawingContext? = nil,
                             for state: ControlState = .normal) -> CGRect {
        guard let attributedString = attributed(for: state) else {
            return .zero
        }
        return attributedString.boundingRect(with: size, options: options, context: context)
    }
}

// MARK: - Equatable

extension Text: Equatable {

    public static func == (lhs: Text, rhs: Text) -> Bool {
        return lhs.value == rhs.value && lhs.styles == rhs.styles
    }
}
