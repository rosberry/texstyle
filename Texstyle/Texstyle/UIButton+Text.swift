//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

extension UIButton {

    /// Applies the text for passed style
    ///
    /// - Parameters:
    ///   - text: A text that should be applied
    ///   - state: Specific control state for this text
    public func setText(_ text: Text, for state: ControlState = .normal) {
        setAttributedTitle(text.attributed, for: state)
    }

    /// Applies the text for passed style
    ///
    /// - Parameters:
    ///   - text: A text that should be applied
    public func setText(_ text: ControlStateText) {
        text.styles.keys.forEach { state in
            setAttributedTitle(text.attributed(for: state), for: state)
        }
    }

    /// Applies the text for passed states.
    ///
    /// - Parameters:
    ///   - text: The text that should be applied
    ///   - states: An array of states for passed text
    public func setText(_ text: Text, for states: [ControlState]) {
        for state in states {
            setAttributedTitle(text.attributed, for: state)
        }
    }

    /// Applies the texts for passed states.
    ///
    /// - Parameters:
    ///   - texts: A dictionary of texts asociated by key with specific state
    public func setTexts(_ texts: [ControlState: Text]) {
        for state in texts.keys {
            setAttributedTitle(texts[state]?.attributed, for: state)
        }
    }
}
