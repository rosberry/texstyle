//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Foundation

public extension Dictionary where Key == ControlState, Value == TextStyle {

    /// Returns a new dictionary with copies of all styles.
    func copy() -> [ControlState: TextStyle] {
        return self.mapValues { style in
            style.copy()
        }
    }
}
