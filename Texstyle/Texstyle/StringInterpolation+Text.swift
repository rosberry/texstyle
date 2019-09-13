//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

public extension String.StringInterpolation {

    mutating func appendInterpolation(_ text: Text) {
        appendLiteral(text.value)
    }
}

#endif
