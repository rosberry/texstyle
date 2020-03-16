//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Foundation

/// Stores range for style applying.
final class TextSubstyle {

    let style: TextStyle
    let range: NSRange

    init(style: TextStyle, range: NSRange) {
        self.style = style
        self.range = range
    }

    public func copy() -> TextSubstyle {
        TextSubstyle(style: style.copy(), range: range)
    }
}

extension TextSubstyle: Equatable {

    public static func == (lhs: TextSubstyle, rhs: TextSubstyle) -> Bool {
        lhs.style == rhs.style && lhs.range == rhs.range
    }
}
