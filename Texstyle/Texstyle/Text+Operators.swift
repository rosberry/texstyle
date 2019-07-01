//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension Text {

    static func + (lhs: Text, rhs: String) -> Text {
        return Text(value: lhs.value + rhs, styles: lhs.styles)
    }

    static func + (lhs: String, rhs: Text) -> Text {
        return Text(value: lhs + rhs.value, styles: rhs.styles)
    }

    static func + (lhs: Text, rhs: Text) -> Text {
        let text = Text(value: lhs.value + rhs.value, styles: lhs.styles)
        rhs.styles.forEach { state, style in
            text.add(style, for: rhs.value, for: state)
        }
        return text
    }
}
