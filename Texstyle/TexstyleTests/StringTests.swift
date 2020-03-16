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
        XCTAssertTrue(text.style === style, "Text has wrong style after initialization")
    }

    func testTextWithStyles() {
        //Given
        let value = "value"
        let styles: [ControlState: TextStyle] = [.random: .random]
        //When
        let text = value.text(with: styles)
        //Then
        XCTAssertEqual(text.value, value, "Text value must be equal to value")
        XCTAssertEqual(text.styles, styles, "Text has wrong styles")
    }
}
