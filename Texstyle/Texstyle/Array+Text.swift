//
//  Copyright © 2019 Rosberry. All rights reserved.
//

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
    func joined(separatorText: Element? = nil) -> Element? {
        if isEmpty {
            return nil
        }
        if count == 1 {
            return self[0]
        }
        var text: Element = self[0]
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
}

public extension Array where Element: SimpleText {

    /// Returns a new text by concatenating the elements of the sequence,
    /// adding the given separator between each element.
    ///
    /// - Parameters:
    ///   - separator: A string to insert between each of the elements
    ///   in this sequence.
    ///   - strategy: The strategy of separator styling. Default value is left.
    /// - Returns: A single, concatenated text.
    func joined(separator: String, strategy: SeparatorStrategy = .left) -> SimpleText {
        if isEmpty {
            return SimpleText(value: "", style: .init())
        }

        if count == 1 {
            return self[0]
        }

        var text: SimpleText = self[0]
        for index in 1..<count {
            let separatorText: SimpleText
            switch strategy {
            case .left:
                separatorText = SimpleText(value: separator, style: text.style)
                separatorText.substyles = text.substyles
            case .right:
                separatorText = SimpleText(value: separator, style: self[index].style)
                separatorText.substyles = self[index].substyles
            }
            //swiftlint:disable:next shorthand_operator
            text = text + separatorText + self[index]
        }
        return text
    }
}

public extension Array where Element: ControlStateText {

    /// Returns a new text by concatenating the elements of the sequence,
    /// adding the given separator between each element.
    ///
    /// - Parameters:
    ///   - separator: A string to insert between each of the elements
    ///   in this sequence.
    ///   - strategy: The strategy of separator styling. Default value is left.
    /// - Returns: A single, concatenated text.
    func joined(separator: String, strategy: SeparatorStrategy = .left) -> ControlStateText {
        if isEmpty {
            return ControlStateText(value: "", style: .init())
        }

        if count == 1 {
            return self[0]
        }

        var text: ControlStateText = self[0]
        for index in 1..<count {
            let separatorText: ControlStateText
            switch strategy {
            case .left:
                separatorText = ControlStateText(value: separator, styles: text.styles)
                separatorText.substyles = text.substyles
            case .right:
                separatorText = ControlStateText(value: separator, styles: self[index].styles)
                separatorText.substyles = self[index].substyles
            }
            //swiftlint:disable:next shorthand_operator
            text = text + separatorText + self[index]
        }
        return text
    }
}
