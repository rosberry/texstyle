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
