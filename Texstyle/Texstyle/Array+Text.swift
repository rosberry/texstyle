//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

/// Strategy of separator styling for joining texts in array.
///
/// - left: Uses styles of left text.
/// - right: Uses styles of right text.
public enum SeparatorStrategy {
    case left
    case right
}

public extension Array where Element: Text {

    /// Returns a new text by concatenating the elements of the sequence,
    /// adding the given separator between each element.
    ///
    /// - Parameter separatorText: A text to insert between each of the elements
    ///   in this sequence. Default value is nil.
    /// - Returns: A single, concatenated text.
    func joined(separatorText: Text? = nil) -> Text {
        if isEmpty {
            return Text(value: "", style: .init())
        }
        if count == 1 {
            return self[0]
        }
        var text: Text = self[0]
        for index in 1..<count {
            //swiftlint:disable shorthand_operator
            if let separatorText = separatorText {
                text = text + separatorText + self[index]
            }
            else {
                text = text + self[index]
            }
            //swiftlint:enable shorthand_operator
        }
        return text
    }

    /// Returns a new text by concatenating the elements of the sequence,
    /// adding the given separator between each element.
    ///
    /// - Parameters:
    ///   - separator: A string to insert between each of the elements
    ///   in this sequence.
    ///   - strategy: The strategy of separator styling. Default value is left.
    /// - Returns: A single, concatenated text.
    func joined(separator: String, strategy: SeparatorStrategy = .left) -> Text {
        if isEmpty {
            return Text(value: "", style: .init())
        }

        if count == 1 {
            return self[0]
        }

        var text: Text = self[0]
        for index in 1..<count {
            let separatorText: Text
            switch strategy {
            case .left:
                separatorText = Text(value: separator, styles: text.styles)
                separatorText.substyles = text.substyles
            case .right:
                separatorText = Text(value: separator, styles: self[index].styles)
                separatorText.substyles = self[index].substyles
            }
            //swiftlint:disable:next shorthand_operator
            text = text + separatorText + self[index]
        }
        return text
    }
}

#endif
