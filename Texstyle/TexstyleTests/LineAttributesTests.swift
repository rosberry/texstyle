//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class LineAttributesTests: XCTestCase {

    func testCopy() {
        //Given
        let attributes = LineAttributes.random
        //When
        let copy = attributes.copy()
        //Then
        XCTAssertEqual(copy, attributes, "Copy must be equal to line attributes")
    }
}
