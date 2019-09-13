//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

public extension Text {

    static func + (lhs: Text, rhs: String) -> Text {
        return Text(value: lhs.value + rhs, styles: lhs.styles)
    }

    static func + (lhs: String, rhs: Text) -> Text {
        return Text(value: lhs + rhs.value, styles: rhs.styles)
    }

    static func + (lhs: Text, rhs: Text) -> Text {
        let text = Text(value: lhs.value + rhs.value, styles: lhs.styles)
        text.substyles.append(contentsOf: lhs.substyles)
        let styleSubstyles = rhs.styles.map { state, style -> TextSubstyle in
            let range = NSRange(location: lhs.value.count, length: rhs.value.count)
            return TextSubstyle(style: style, range: range, state: state)
        }
        text.substyles.append(contentsOf: styleSubstyles)
        let rhsSubstyles = rhs.substyles.map { substyle -> TextSubstyle in
            let range = NSRange(location: lhs.value.count + substyle.range.location, length: substyle.range.length)
            return TextSubstyle(style: substyle.style, range: range, state: substyle.state)
        }
        text.substyles.append(contentsOf: rhsSubstyles)
        return text
    }
}

#endif
