//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class ControlStateTests: XCTestCase {

    func testHash() {
        //Given
        let state1 = ControlState.normal
        let state2 = ControlState.normal
        let state3 = ControlState.disabled
        var hasher1 = Hasher()
        var hasher2 = Hasher()
        var hasher3 = Hasher()
        //When
        state1.hash(into: &hasher1)
        state2.hash(into: &hasher2)
        state3.hash(into: &hasher3)
        //Then
        XCTAssertEqual(hasher1.finalize(), hasher2.finalize(), "Hash for the same states must be equal")
        XCTAssertNotEqual(hasher1.finalize(), hasher3.finalize(), "Hash for different states must not be equal")
    }
}
