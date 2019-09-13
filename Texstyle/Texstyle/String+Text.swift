//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

extension String {

    public func text(with style: TextStyle) -> Text {
        return Text(value: self, style: style)
    }

    public func text(with styles: [ControlState: TextStyle]) -> Text {
        return Text(value: self, styles: styles)
    }
}

#endif
