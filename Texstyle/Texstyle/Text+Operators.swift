//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension Text {

    static func + (lhs: Text, rhs: String) -> Text {
        Text(value: lhs.value + rhs, style: lhs.style)
    }

    static func + (lhs: String, rhs: Text) -> Text {
        Text(value: lhs + rhs.value, style: rhs.style)
    }

    static func + (lhs: Text, rhs: Text) -> Text {
        let text = Text(value: lhs.value + rhs.value, style: lhs.style)
        text.substyles.append(contentsOf: lhs.substyles)

        let range = NSRange(location: lhs.value.count, length: rhs.value.count)
        let substyle = TextSubstyle(style: rhs.style, range: range)
        text.substyles.append(substyle)

        let rhsSubstyles = rhs.substyles.map { substyle -> TextSubstyle in
            let range = NSRange(location: lhs.value.count + substyle.range.location, length: substyle.range.length)
            return TextSubstyle(style: substyle.style, range: range)
        }
        text.substyles.append(contentsOf: rhsSubstyles)

        return text
    }
}

public extension ControlStateText {

    static func + (lhs: ControlStateText, rhs: String) -> ControlStateText {
        ControlStateText(value: lhs.value + rhs, styles: lhs.styles)
    }

    static func + (lhs: String, rhs: ControlStateText) -> ControlStateText {
        ControlStateText(value: lhs + rhs.value, styles: rhs.styles)
    }

    static func + (lhs: ControlStateText, rhs: ControlStateText) -> ControlStateText {
        let text = ControlStateText(value: lhs.value + rhs.value, styles: lhs.styles)

        lhs.substyles.forEach { state, substyles in
            var array = text.substyles[state] ?? []
            array.append(contentsOf: substyles)
            text.substyles[state] = array
        }

        let range = NSRange(location: lhs.value.count, length: rhs.value.count)

        rhs.styles.forEach { state, style in
            let substyle = TextSubstyle(style: style, range: range)
            var array = text.substyles[state] ?? []
            array.append(substyle)
            text.substyles[state] = array
        }

        rhs.substyles.forEach { state, substyles in
            var array = text.substyles[state] ?? []
            substyles.forEach { substyle in
                let range = NSRange(location: lhs.value.count + substyle.range.location, length: substyle.range.length)
                let substyle = TextSubstyle(style: substyle.style, range: range)
                array.append(substyle)
            }
            text.substyles[state] = array
        }

        return text
    }
}
