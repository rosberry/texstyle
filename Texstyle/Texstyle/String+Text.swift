//
//  Copyright © 2019 Rosberry. All rights reserved.
//

extension String {

    public func text(with style: TextStyle) -> Text {
        Text(value: self, style: style)
    }

    public func text(with styles: [ControlState: TextStyle]) -> ControlStateText {
        ControlStateText(value: self, styles: styles)
    }
}
