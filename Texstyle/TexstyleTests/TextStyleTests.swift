//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class TextStyleTests: XCTestCase {

    func testCopy() {
        //Given
        let style = TextStyle.random
        //When
        let copy = style.copy()
        //Then
        XCTAssertTrue(copy.font == style.font, "Copy has wrong font")
        XCTAssertTrue(copy.color == style.color, "Copy has wrong color")
        XCTAssertTrue(copy.backgroundColor == style.backgroundColor, "Copy has wrong backgroundColor")
        XCTAssertTrue(copy.kerning == style.kerning, "Copy has wrong kerning")
        XCTAssertTrue(copy.strokeWidth == style.strokeWidth, "Copy has wrong strokeWidth")
        XCTAssertTrue(copy.baselineOffset == style.baselineOffset, "Copy has wrong baselineOffset")
        XCTAssertTrue(copy.obliqueness == style.obliqueness, "Copy has wrong obliqueness")
        XCTAssertTrue(copy.expansion == style.expansion, "Copy has wrong expansion")
        XCTAssertTrue(copy.strikeThroughLine == style.strikeThroughLine, "Copy has wrong strikeThroughLine")
        XCTAssertTrue(copy.underlineLine == style.underlineLine, "Copy has wrong underlineLine")
        XCTAssertTrue(copy.effectStyle == style.effectStyle, "Copy has wrong effectStyle")
        XCTAssertTrue(copy.attachment == style.attachment, "Copy has wrong attachment")
        XCTAssertTrue(copy.alignment == style.alignment, "Copy has wrong alignment")
        XCTAssertTrue(copy.lineBreakMode == style.lineBreakMode, "Copy has wrong lineBreakMode")
        XCTAssertTrue(copy.lineSpacing == style.lineSpacing, "Copy has wrong lineSpacing")
        XCTAssertTrue(copy.paragraphSpacing == style.paragraphSpacing, "Copy has wrong paragraphSpacing")
        XCTAssertTrue(copy.paragraphSpacingBefore == style.paragraphSpacingBefore, "Copy has wrong paragraphSpacingBefore")
        XCTAssertTrue(copy.lineHeight == style.lineHeight, "Copy has wrong lineHeight")
        XCTAssertTrue(copy.paragraphStyle == style.paragraphStyle, "Copy has wrong paragraphStyle")
        XCTAssertTrue(copy.link == style.link, "Copy has wrong link")
    }

    func testEquality() {
        //Given
        let style = TextStyle.random
        //When

        //Then
        XCTAssertTrue(style == style, "Style is not equal to itself")
    }

    func testParagraphStyle() {
        //Given
        let style = TextStyle.random
        style.paragraphStyle = .random
        //When
        let attributes = style.attributes
        //Then
        XCTAssertTrue((attributes[.paragraphStyle] as? NSParagraphStyle) == style.paragraphStyle, "Attributes have wrong paragraph style")
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
