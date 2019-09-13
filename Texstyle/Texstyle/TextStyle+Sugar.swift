//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

extension TextStyle {

    /// Applies center to alignment attribute.
    ///
    /// - Returns: The style with updated alignment attribute.
    @discardableResult
    public func centerAligned() -> TextStyle {
        let copy = self.copy()
        copy.alignment = .center
        return copy
    }

    /// Applies left to alignment attribute.
    ///
    /// - Returns: The style with updated alignment attribute.
    public func leftAligned() -> TextStyle {
        let copy = self.copy()
        copy.alignment = .left
        return copy
    }

    /// Applies right to alignment attribute.
    ///
    /// - Returns: The style with updated alignment attribute.
    public func rightAligned() -> TextStyle {
        let copy = self.copy()
        copy.alignment = .right
        return copy
    }

    /// Applies natural to alignment attribute.
    ///
    /// - Returns: The style with updated alignment attribute.
    public func naturalAligned() -> TextStyle {
        let copy = self.copy()
        copy.alignment = .natural
        return copy
    }

    /// Applies justified to alignment attribute.
    ///
    /// - Returns: The style with updated alignment attribute.
    public func justifiedAligned() -> TextStyle {
        let copy = self.copy()
        copy.alignment = .justified
        return copy
    }

    /// Applies 0 to lineHeight attribute.
    ///
    /// - Returns: The style with updated lineHeight attribute.
    public func lineHeightReseted() -> TextStyle {
        let copy = self.copy()
        copy.lineHeight = 0
        return copy
    }
}

#endif
