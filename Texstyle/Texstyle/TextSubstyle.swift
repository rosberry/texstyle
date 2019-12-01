//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Foundation

/// Stores range for style applying.
final class TextSubstyle {

    let style: TextStyle
    let range: NSRange
    let state: ControlState

    init(style: TextStyle, range: NSRange, state: ControlState) {
        self.style = style
        self.range = range
        self.state = state
    }

    public func copy() -> TextSubstyle {
        TextSubstyle(style: style.copy(), range: range, state: state)
    }
}

extension TextSubstyle: Equatable {

    public static func == (lhs: TextSubstyle, rhs: TextSubstyle) -> Bool {
        lhs.style == rhs.style && lhs.range == rhs.range && lhs.state == rhs.state
    }
}
