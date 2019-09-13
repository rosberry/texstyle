//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

import UIKit

open class ShadowStyle {

    open var offset: CGSize = .zero
    open var radius: CGFloat = 0
    open var color: UIColor = .clear

    open var shadow: NSShadow {
        let shadow = NSShadow()
        shadow.shadowBlurRadius = radius
        shadow.shadowOffset = offset
        shadow.shadowColor = color
        return shadow
    }

    public init() {
    }

    public func copy() -> ShadowStyle {
        let copy = ShadowStyle()
        copy.offset = offset
        copy.radius = radius
        copy.color = color
        return copy
    }
}

// MARK: - Equatable

extension ShadowStyle: Equatable {

    public static func == (lhs: ShadowStyle, rhs: ShadowStyle) -> Bool {
        return lhs.offset == rhs.offset &&
            lhs.radius == rhs.radius &&
            lhs.color == rhs.color
    }
}

#endif
