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
        XCTAssertEqual(text.value, value, "Text value is not equal to value")
        XCTAssertEqual(text.styles.count, 1, "Text has wrong style safter initialization")
        XCTAssertTrue(text.styles[.normal] === style, "Text has wrong normal style after initialization")
    }

    func testTextWithStyles() {
        //Given
        let value = "value"
        let styles: [ControlState: TextStyle] = [.random: .random]
        //When
        let text = value.text(with: styles)
        //Then
        XCTAssertEqual(text.value, value, "Text value is not equal to value")
        XCTAssertEqual(text.styles, styles, "Text has wrong styles")
    }
}
