//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

extension UIButton {

    /// Applies the text for all states.
    public func setText(_ text: Text) {
        for state in text.styles.keys {
            setAttributedTitle(text.attributed(for: state), for: state)
        }
    }
}
