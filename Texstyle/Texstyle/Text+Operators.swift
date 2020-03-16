//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension BaseText {

    static func + (lhs: Self, rhs: Self) -> Self {
        lhs.concat(rhs)
    }
}

public extension Text {

    static func + (lhs: Text, rhs: String) -> Text {
        Text(value: lhs.value + rhs, style: lhs.style)
    }

    static func + (lhs: String, rhs: Text) -> Text {
        Text(value: lhs + rhs.value, style: rhs.style)
    }
}

public extension ControlStateText {

    static func + (lhs: ControlStateText, rhs: String) -> ControlStateText {
        ControlStateText(value: lhs.value + rhs, styles: lhs.styles)
    }

    static func + (lhs: String, rhs: ControlStateText) -> ControlStateText {
        ControlStateText(value: lhs + rhs.value, styles: rhs.styles)
    }
}
