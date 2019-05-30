//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

extension UIButton {

    /// Applies the text for all states.
    public func setText(_ text: Text) {
        for (state, _) in text.styles {
            setAttributedTitle(text.attributed(for: state), for: state)
        }
    }
}
