//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

import UIKit

public class LineAttributes {

    var style: NSUnderlineStyle
    var color: UIColor?

    #if swift(>=4.2)
    /// - Parameters:
    ///   - style: The style for line attributes. Default is single.
    ///   - color: The color for line attributes. Default is nil.
    public init(style: NSUnderlineStyle = .single, color: UIColor? = nil) {
        self.style = style
        self.color = color
    }
    #else
    /// - Parameters:
    ///   - style: The style for line attributes. Default is styleSingle.
    ///   - color: The color for line attributes. Default is nil.
    init(style: NSUnderlineStyle = .styleSingle, color: UIColor? = nil) {
        self.style = style
        self.color = color
    }
    #endif
}

// MARK: - Equatable

extension LineAttributes: Equatable {
    public static func == (lhs: LineAttributes, rhs: LineAttributes) -> Bool {
        return lhs.color == rhs.color &&
            lhs.style == rhs.style
    }
}

#endif
