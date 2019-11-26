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
        XCTAssertEqual(style.color, .black, "Default color must be equal to nil")
        XCTAssertEqual(style.backgroundColor, .clear, "Default backgroundColor must be equal to nil")
        XCTAssertEqual(style.ligature, nil, "Default ligature must be equal to nil")
        XCTAssertEqual(style.kerning, nil, "Default kerning must be equal to nil")
        XCTAssertEqual(style.strokeWidth, nil, "Default strokeWidth must be equal to nil")
        XCTAssertEqual(style.shadowStyle, nil, "Default shadowStyle must be equal to nil")
        XCTAssertEqual(style.effectStyle, nil, "Default effectStyle must be equal to nil")
        XCTAssertEqual(style.baselineOffset, nil, "Default baselineOffset must be equal to nil")
        XCTAssertEqual(style.obliqueness, nil, "Default obliqueness must be equal to nil")
        XCTAssertEqual(style.expansion, nil, "Default expansion must be equal to nil")
        XCTAssertEqual(style.strikeThroughLine, nil, "Default strikeThroughLine must be equal to nil")
        XCTAssertEqual(style.underlineLine, nil, "Default underlineLine must be equal to nil")
        XCTAssertEqual(style.strokeColor, nil, "Default strokeColor must be equal to nil")
        XCTAssertEqual(style.attachment, nil, "Default attachment must be equal to nil")
        XCTAssertEqual(style.link, nil, "Default link must be equal to nil")
        XCTAssertEqual(style.alignment, .natural, "Default alignment must be equal to natural")
        XCTAssertEqual(style.lineBreakMode, .byTruncatingTail, "Default lineBreakMode must be equal to byTruncatingTail")
        XCTAssertEqual(style.lineSpacing, nil, "Default lineSpacing must be equal to nil")
        XCTAssertEqual(style.paragraphSpacing, nil, "Default paragraphSpacing must be equal to nil")
        XCTAssertEqual(style.paragraphSpacingBefore, nil, "Default paragraphSpacingBefore must be equal to nil")
        XCTAssertEqual(style.lineHeight, nil, "Default lineHeight must be equal to nil")
        XCTAssertEqual(style.paragraphStyle, nil, "Default paragraphStyle must be equal to nil")
    }
}
