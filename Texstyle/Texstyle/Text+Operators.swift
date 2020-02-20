//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension Text {

    static func + (lhs: Self, rhs: Self) -> Self {
        lhs.concat(rhs)
    }
}

public extension SimpleText {

    static func + (lhs: SimpleText, rhs: String) -> SimpleText {
        SimpleText(value: lhs.value + rhs, style: lhs.style)
    }

    static func + (lhs: String, rhs: SimpleText) -> SimpleText {
        SimpleText(value: lhs + rhs.value, style: rhs.style)
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
