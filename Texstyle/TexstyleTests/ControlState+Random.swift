//
//  Copyright © 2019 Rosberry. All rights reserved.
//

@testable import Texstyle

extension ControlState {

    static let allCases: [ControlState] = [.normal, .highlighted, .disabled, .selected, .focused, .application, reserved]

    static var random: ControlState {
        return allCases.randomElement()!
    }
}
