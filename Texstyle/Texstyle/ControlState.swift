//
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(UIKit)

import UIKit

#if swift(>=4.2)
public typealias ControlState = UIControl.State
#else
public typealias ControlState = UIControlState
#endif

// MARK: - Hashable

extension ControlState: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}

#endif
