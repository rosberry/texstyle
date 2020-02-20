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
        XCTAssertEqual(style.offset, .zero, "Style must have zero offset by default")
        XCTAssertEqual(style.radius, 0, "Style must have zero radius by default")
        XCTAssertEqual(style.color, .clear, "Style must have clear by default")
    }

    func testEquality() {
        //Given
        let style = ShadowStyle.random
        //When

        //Then
        XCTAssertEqual(style, style, "Style must be equal to itself")
    }

    func testCopy() {
        //Given
        let style = ShadowStyle.random
        //When
        let copy = style.copy()
        //Then
        XCTAssertFalse(copy === style, "Copy must be a different object instance.")
        XCTAssertEqual(copy, style, "Copy must be equal to style")
    }

    func testShadow() {
        //Given
        let style = ShadowStyle.random
        //When
        let shadow = style.shadow
        //Then
        XCTAssertEqual(shadow.shadowOffset, style.offset, "Shadow offset must be equal to style offset")
        XCTAssertEqual(shadow.shadowBlurRadius, style.radius, "Shadow radius must be equal to style radius")
        XCTAssertEqual(shadow.shadowColor as? UIColor, style.color, "Shadow color must be equal to style color")
    }
}
