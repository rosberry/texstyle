//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class ShadowStyleTests: XCTestCase {

    func testDefaultParameters() {
        //Given
        let style = ShadowStyle()
        //When

        //Then
        XCTAssertEqual(style.offset, .zero, "")
        XCTAssertEqual(style.radius, 0, "")
        XCTAssertEqual(style.color, .clear, "")
    }

    func testEquality() {
        //Given
        let style = ShadowStyle.random
        //When

        //Then
        XCTAssertEqual(style, style, "Style is not equal to itself")
    }

    func testCopy() {
        //Given
        let style = ShadowStyle.random
        //When
        let copy = style.copy()
        //Then
        XCTAssertEqual(copy, style, "Copy is not equal to style")
    }

    func testShadow() {
        //Given
        let style = ShadowStyle.random
        //When
        let shadow = style.shadow
        //Then
        XCTAssertEqual(shadow.shadowOffset, style.offset, "Shadow offset is not equal to style offset")
        XCTAssertEqual(shadow.shadowBlurRadius, style.radius, "Shadow radius is not equal to style radius")
        XCTAssertEqual(shadow.shadowColor as? UIColor, style.color, "Shadow color is not equal to style color")
    }
}
