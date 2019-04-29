//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class TextTests: XCTestCase {

    // MARK: - Values

    private let value: String = .random(length: 6)
    private let substring1: String = .random(length: 6)
    private let substring2: String = .random(length: 6)

    // MARK: - Styles

    private let style: TextStyle = .random
    private let style1: TextStyle = .random
    private let style2: TextStyle = .random
    private let style3: TextStyle = .random

    // MARK: - Initialization

    func testInitWithValueAndStyle() {
        //Given

        //When
        let text = Text(value: value, style: style)
        //Then
        test(text, withValue: value, for: .normal, with: style)
    }

    func testInitWithoutValueAndWithStyle() {
        //Given

        //When
        let text = Text(value: nil, style: style)
        //Then
        XCTAssertNil(text, "Text must be nil with nil value")
    }

    func testInitWithOptionalValueAndWithStyle() {
        //Given
        let value1: String? = value
        //When
        let text = Text(value: value1, style: style)
        //Then
        XCTAssertNotNil(text, "Text must not be nil with nil value")
        test(text, withValue: value, for: .normal, with: style)
    }

    func testInitWithValueAndStyles() {
        //Given
        let styles: [ControlState: TextStyle] = [.normal: style]
        //When
        let text = Text(value: value, styles: styles)
        //Then
        XCTAssertEqual(text.value, value, "Text has wrong value after initialization")
        XCTAssertEqual(text.styles, styles, "Text has wrong styles after initialization")
    }

    func testInitWithoutValueAndWithStyles() {
        //Given
        let styles: [ControlState: TextStyle] = [.normal: style]
        //When
        let text = Text(value: nil, styles: styles)
        //Then
        XCTAssertNil(text, "Text must be nil with nil value")
    }

    func testInitWithOptionalValueAndStyles() {
        //Given
        let value1: String? = value
        let styles: [ControlState: TextStyle] = [.normal: style]
        //When
        let text = Text(value: value1, styles: styles)
        //Then
        XCTAssertNotNil(text, "Text must not be nil with nil value")
        XCTAssertTrue(text?.value == value, "Text has wrong value after initialization")
        XCTAssertTrue(text?.styles == styles, "Text has wrong styles after initialization")
    }

    func testInitWithEmptyStyles() {
        //Given
        let text = Text(value: value, styles: [:])
        //When

        //Then
        for state in ControlState.allCases {
            XCTAssertNil(text.styles[state], "Style must be nil for \(state) state")
            XCTAssertNil(text.attributed(for: state), "String must be nil for \(state) state")
        }
    }

    // MARK: - Attributed

    func testAttributed() {
        //Given

        //When
        let text = Text(value: value, style: style)
        //Then
        XCTAssertEqual(text.attributed, text.attributed(for: .normal), "Attributed is not equal to normal attributed string")
    }

    // MARK: - Attributes

    func testAttributesForNormalState() {
        //Given

        //When
        let text = Text(value: value, style: style)
        //Then
        test(style.attributes, in: text, in: .init(location: 0, length: value.count))
    }

    func testAttributesForPassedState() {
        //Given
        let state = ControlState.disabled
        //When
        let text = Text(value: value, styles: [state: style])
        //Then
        test(style.attributes, in: text, for: state, in: .init(location: 0, length: value.count))
    }

    // MARK: - Substyles

    func testAddSubstyleForNormalState() {
        //Given
        let range = NSRange(location: 0, length: 2)
        let text = Text(value: value, style: style1)
        //When
        text.add(style2, at: range)
        //Then
        test(text, withValue: value, for: .normal, with: style1)
        test(style2.attributes, in: text, in: range)
    }

    func testAddSubstyleForPassedState() {
        //Given
        let state = ControlState.disabled
        let range = NSRange(location: 0, length: 2)
        let text = Text(value: value, styles: [state: style1])
        //When
        text.add(style2, at: range, for: state)
        //Then
        test(text, withValue: value, for: state, with: style1)
        test(style2.attributes, in: text, for: state, in: range)
    }

    func testAddSubstylesForNormalState() {
        //Given
        let range2 = NSRange(location: 0, length: 2)
        let range3 = NSRange(location: 2, length: 2)
        let text = Text(value: value, style: style1)
        //When
        text.add(style2, at: range2)
        text.add(style3, at: range3)
        //Then
        test(text, withValue: value, for: .normal, with: style1)
        test(style2.attributes, in: text, in: range2)
        test(style3.attributes, in: text, in: range3)
    }

    func testAddSubstylesForPassedState() {
        //Given
        let state = ControlState.disabled
        let range2 = NSRange(location: 0, length: 2)
        let range3 = NSRange(location: 2, length: 2)
        let text = Text(value: value, styles: [state: style1])
        //When
        text.add(style2, at: range2, for: state)
        text.add(style3, at: range3, for: state)
        //Then
        test(text, withValue: value, for: state, with: style1)
        test(style2.attributes, in: text, for: state, in: range2)
        test(style3.attributes, in: text, for: state, in: range3)
    }

    // MARK: - Substrings

    func testAddSubstringForNormalState() {
        //Given
        let value1 = substring1 + value + substring1
        let text = Text(value: value1, style: style1)
        //When
        text.add(style2, for: substring1)
        //Then
        test(text, withValue: value1, for: .normal, with: style1)
        test(style2.attributes, in: text, for: .normal, withSubstring: substring1)
    }

    func testAddSubstringForPassedState() {
        //Given
        let value1 = substring1 + value + substring1
        let state = ControlState.disabled
        let text = Text(value: value1, styles: [state: style1])
        //When
        text.add(style2, for: substring1, for: state)
        //Then
        test(text, withValue: value1, for: state, with: style1)
        test(style2.attributes, in: text, for: state, withSubstring: substring1)
    }

    func testAddSubstringsForNormalState() {
        //Given
        let value1 = substring1 + value + substring2
        let text = Text(value: value1, style: style)
        //When
        text.add(style1, for: substring1)
        text.add(style2, for: substring2)
        //Then
        test(text, withValue: value1, for: .normal, with: style)

        let range = value1.startIndex..<value1.endIndex

        if let range1 = value1.range(of: substring1, range: range), !range1.isEmpty {
            let nsRange = NSRange(range1, in: value1)
            test(style1.attributes, in: text, in: nsRange)
        }

        if let range2 = value1.range(of: substring2, range: range), !range2.isEmpty {
            let nsRange = NSRange(range2, in: value1)
            test(style2.attributes, in: text, in: nsRange)
        }
    }

    func testAddSubstringsForPassedState() {
        //Given
        let value1 = substring1 + value + substring2
        let state = ControlState.disabled
        let text = Text(value: value1, styles: [state: style])
        //When
        text.add(style1, for: substring1, for: state)
        text.add(style2, for: substring2, for: state)
        //Then
        test(text, withValue: value1, for: state, with: style)

        let range = value1.startIndex..<value1.endIndex

        if let range1 = value1.range(of: substring1, range: range), !range1.isEmpty {
            let nsRange = NSRange(range1, in: value1)
            test(style1.attributes, in: text, for: state, in: nsRange)
        }

        if let range2 = value1.range(of: substring2, range: range), !range2.isEmpty {
            let nsRange = NSRange(range2, in: value1)
            test(style2.attributes, in: text, for: state, in: nsRange)
        }
    }

    // MARK: - Private

    private func test(_ text: Text?, withValue value: String?, for state: ControlState, with style: TextStyle) {
        XCTAssertTrue(text?.value == value, "Text has wrong value after initialization")
        XCTAssertTrue(text?.styles.count == 1, "Text has wrong style after initialization")
        XCTAssertTrue(text?.styles[state] === style, "Text has wrong style for \(state) state after initialization")
    }

    private func test(_ attributes: TextStyleAttributes, in text: Text, for state: ControlState = .normal, in range: NSRange) {
        let string = text.attributed(for: state)
        XCTAssertNotNil(string, "String must not be nil")
        string?.enumerateAttributes(in: range, options: .longestEffectiveRangeNotRequired) { enumeratedAttributes, _, _ in
            for (key, attribute) in enumeratedAttributes {
                let message = "\(attribute) value is not equal to \(String(describing: attributes[key])) value for \(key.rawValue) key"
                XCTAssertTrue(isEqial(a: attribute, b: attributes[key], key: key), message)
            }
        }
    }

    private func test(_ attributes: TextStyleAttributes, in text: Text, for state: ControlState, withSubstring substring: String) {
        var searchStartIndex = value.startIndex
        let endIndex = value.endIndex

        while searchStartIndex < endIndex, let range = value.range(of: substring, range: searchStartIndex..<endIndex),
            !range.isEmpty {
                let nsRange = NSRange(range, in: value)
                test(attributes, in: text, for: state, in: nsRange)
                searchStartIndex = range.upperBound
        }
    }

    //swiftlint:disable:next cyclomatic_complexity
    private func isEqial(a: Any?, b: Any?, key: AttributedStringKey) -> Bool {
        if key == .font {
            return TexstyleTests.isEqual(type: UIFont.self, a: a, b: b)
        }
        if key == .paragraphStyle {
            return TexstyleTests.isEqual(type: NSParagraphStyle.self, a: a, b: b)
        }
        if key == .foregroundColor {
            return TexstyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .backgroundColor {
            return TexstyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .ligature {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .kern {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .strikethroughStyle {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .underlineStyle {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .strokeColor {
            return TexstyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .strokeWidth {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .shadow {
            return TexstyleTests.isEqual(type: NSShadow.self, a: a, b: b)
        }
        if key == .textEffect {
            return TexstyleTests.isEqual(type: NSString.self, a: a, b: b)
        }
        if key == .attachment {
            return TexstyleTests.isEqual(type: NSTextAttachment.self, a: a, b: b)
        }
        if key == .link {
            return TexstyleTests.isEqual(type: NSURL.self, a: a, b: b) || TexstyleTests.isEqual(type: NSString.self, a: a, b: b)
        }
        if key == .baselineOffset {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .underlineColor {
            return TexstyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .strikethroughColor {
            return TexstyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .obliqueness {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .expansion {
            return TexstyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        return false
    }
}

private func isEqual<T: Equatable>(type: T.Type, a: Any?, b: Any?) -> Bool {
    guard let a = a as? T, let b = b as? T else {
        return false
    }
    return a == b
}
