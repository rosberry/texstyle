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
        XCTAssertEqual(style, style, "Style must be equal to itself")
    }

    func testCopy() {
        //Given
        let style = TextStyle.random
        //When
        let copy = style.copy()
        //Then
        XCTAssertFalse(copy === style, "Copy must be a different object instance.")
        XCTAssertEqual(copy, style, "Copy must be equal to style")
        XCTAssertFalse(copy.shadowStyle === style.shadowStyle, "Shadow style must be a copy")
        XCTAssertFalse(copy.strikeThroughLine === style.strikeThroughLine, "StrikeThroughLine must be a copy")
        XCTAssertFalse(copy.underlineLine === style.underlineLine, "UnderlineLine must be a copy")
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

    func testDefaultValues() {
        //Given
        let style = TextStyle()
        //When

        //Then
        XCTAssertEqual(style.font, .systemFont(ofSize: 12), "Default style font must be equal to system font of 12 size")
        XCTAssertEqual(style.color, .black, "Default color must be equal to black")
        XCTAssertEqual(style.backgroundColor, .clear, "Default backgroundColor must be equal to clear")
        XCTAssertNil(style.ligature, "Default ligature must be equal to nil")
        XCTAssertNil(style.kerning, "Default kerning must be equal to nil")
        XCTAssertNil(style.strokeWidth, "Default strokeWidth must be equal to nil")
        XCTAssertNil(style.shadowStyle, "Default shadowStyle must be equal to nil")
        XCTAssertNil(style.effectStyle, "Default effectStyle must be equal to nil")
        XCTAssertNil(style.baselineOffset, "Default baselineOffset must be equal to nil")
        XCTAssertNil(style.obliqueness, "Default obliqueness must be equal to nil")
        XCTAssertNil(style.expansion, "Default expansion must be equal to nil")
        XCTAssertNil(style.strikeThroughLine, "Default strikeThroughLine must be equal to nil")
        XCTAssertNil(style.underlineLine, "Default underlineLine must be equal to nil")
        XCTAssertNil(style.strokeColor, "Default strokeColor must be equal to nil")
        XCTAssertNil(style.attachment, "Default attachment must be equal to nil")
        XCTAssertNil(style.link, "Default link must be equal to nil")
        XCTAssertEqual(style.alignment, .natural, "Default alignment must be equal to natural")
        XCTAssertEqual(style.lineBreakMode, .byTruncatingTail, "Default lineBreakMode must be equal to byTruncatingTail")
        XCTAssertNil(style.lineSpacing, "Default lineSpacing must be equal to nil")
        XCTAssertNil(style.paragraphSpacing, "Default paragraphSpacing must be equal to nil")
        XCTAssertNil(style.paragraphSpacingBefore, "Default paragraphSpacingBefore must be equal to nil")
        XCTAssertNil(style.lineHeight, "Default lineHeight must be equal to nil")
        XCTAssertNil(style.paragraphStyle, "Default paragraphStyle must be equal to nil")
    }
}
