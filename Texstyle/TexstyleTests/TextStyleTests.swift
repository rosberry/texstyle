//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class TextStyleTests: XCTestCase {

    func testEquality() {
        //Given
        let style = TextStyle.random
        //When

        //Then
        XCTAssertEqual(style, style, "Style is not equal to itself")
    }

    func testCopy() {
        //Given
        let style = TextStyle.random
        //When
        let copy = style.copy()
        //Then
        XCTAssertEqual(copy, style, "Copy is not equal to style")
    }

    func testParagraphStyle() {
        //Given
        let style = TextStyle.random
        style.paragraphStyle = .random
        //When
        let attributes = style.attributes
        //Then
        XCTAssertEqual((attributes[.paragraphStyle] as? NSParagraphStyle), style.paragraphStyle, "Attributes have wrong paragraph style")
    }

    // MARK: - Sugar

    func testCenterAligned() {
        //Given
        let style = TextStyle.random
        //When
        let centerAlignedStyle = style.centerAligned()
        //Then
        XCTAssertEqual(centerAlignedStyle.alignment, .center, "Style's alignment must be equal to center")
    }

    func testLeftAligned() {
        //Given
        let style = TextStyle.random
        //When
        let centerAlignedStyle = style.leftAligned()
        //Then
        XCTAssertEqual(centerAlignedStyle.alignment, .left, "Style's alignment must be equal to left")
    }

    func testRightAligned() {
        //Given
        let style = TextStyle.random
        //When
        let centerAlignedStyle = style.rightAligned()
        //Then
        XCTAssertEqual(centerAlignedStyle.alignment, .right, "Style's alignment must be equal to right")
    }

    func testNaturalAligned() {
        //Given
        let style = TextStyle.random
        //When
        let centerAlignedStyle = style.naturalAligned()
        //Then
        XCTAssertEqual(centerAlignedStyle.alignment, .natural, "Style's alignment must be equal to natural")
    }

    func testJustifiedAligned() {
        //Given
        let style = TextStyle.random
        //When
        let centerAlignedStyle = style.justifiedAligned()
        //Then
        XCTAssertEqual(centerAlignedStyle.alignment, .justified, "Style's alignment must be equal to justified")
    }

    func testLineHeightReseted() {
        //Given
        let style = TextStyle.random
        //When
        let centerAlignedStyle = style.lineHeightReseted()
        //Then
        XCTAssertEqual(centerAlignedStyle.lineHeight, 0, "Style's line height must be equal to 0")
    }
}
