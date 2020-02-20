//
//  Copyright © 2019 Rosberry. All rights reserved.
//

extension String {

    public func text(with style: TextStyle) -> SimpleText {
        SimpleText(value: self, style: style)
    }
}
