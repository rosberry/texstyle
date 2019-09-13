//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

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
}

#endif
