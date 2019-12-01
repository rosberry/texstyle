//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class TextSubstyleTests: XCTestCase {

    func testEquality() {
        //Given
        let substyle = TextSubstyle.random
        //When

        //Then
        XCTAssertEqual(substyle, substyle, "Substyle must be equal to itself")
    }

    func testCopy() {
        //Given
        let substyle = TextSubstyle.random
        //When
        let copy = substyle.copy()
        //Then
        XCTAssertFalse(copy === substyle, "Copy must be a different object instance.")
        XCTAssertEqual(copy, substyle, "Copy must be equal to substyle")
    }
}
