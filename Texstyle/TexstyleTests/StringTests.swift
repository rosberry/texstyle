//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class StringTests: XCTestCase {

    func testTextWithStyle() {
        //Given
        let value = "value"
        let style = TextStyle.random
        //When
        let text = value.text(with: style)
        //Then
        XCTAssertEqual(text.value, value, "Text value must be equal to value")
        XCTAssertTrue(text.style === style, "Text has wrong normal style after initialization")
    }

    func testTextWithStyles() {
        //Given
        let value = "value"
        let style: TextStyle = .random
        //When
        let text = value.text(with: style)
        //Then
        XCTAssertEqual(text.value, value, "Text value must be equal to value")
        XCTAssertEqual(text.style, style, "Text has wrong styles")
    }
}
