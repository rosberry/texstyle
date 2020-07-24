//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class ControlStateTextTests: CommonTextTests {

    // MARK: - Values

    private lazy var value: String = .random(length: 6)
    private lazy var substring1: String = .random(length: 6)
    private lazy var substring2: String = .random(length: 6)
    private lazy var substring3: String = .random(length: 6)
    private lazy var substring4: String = .random(length: 6)

    // MARK: - Styles

    private lazy var style: TextStyle = .random
    private lazy var style1: TextStyle = .random
    private lazy var style2: TextStyle = .random
    private lazy var style3: TextStyle = .random

    // MARK: - Text

    private lazy var text = ControlStateText(value: value, style: style1)

    private var styles: [ControlState: TextStyle] {
        var styles = [ControlState: TextStyle]()
        for state in ControlState.allCases {
            styles[state] = .random
        }
        return styles
    }

    // MARK: - Initialization

    func testInitWithValueAndStyle() {
        //Given

        //When
        let text = ControlStateText(value: value, style: style)
        //Then
        test(text, withValue: value, for: .normal, with: style)
    }

    func testInitWithoutValueAndWithStyle() {
        //Given

        //When
        let text = ControlStateText(value: nil, style: style)
        //Then
        XCTAssertNil(text, "Text must be nil with nil value")
    }

    func testInitWithOptionalValueAndWithStyle() {
        //Given
        let value1: String? = value
        //When
        let text = ControlStateText(value: value1, style: style)
        //Then
        XCTAssertNotNil(text, "Text must not be nil with nil value")
        test(text, withValue: value, for: .normal, with: style)
    }

    func testInitWithValueAndStyles() {
        //Given
        let styles: [ControlState: TextStyle] = [.normal: style]
        //When
        let text = ControlStateText(value: value, styles: styles)
        //Then
        XCTAssertEqual(text.value, value, "Text has wrong value after initialization")
        XCTAssertEqual(text.styles, styles, "Text has wrong styles after initialization")
    }

    func testInitWithoutValueAndWithStyles() {
        //Given
        let styles: [ControlState: TextStyle] = [.normal: style]
        //When
        let text = ControlStateText(value: nil, styles: styles)
        //Then
        XCTAssertNil(text, "Text must be nil with nil value")
    }

    func testInitWithOptionalValueAndStyles() {
        //Given
        let value1: String? = value
        let styles: [ControlState: TextStyle] = [.normal: style]
        //When
        let text = ControlStateText(value: value1, styles: styles)
        //Then
        XCTAssertNotNil(text, "Text must not be nil with nil value")
        XCTAssertEqual(text?.value, value, "Text has wrong value after initialization")
        XCTAssertEqual(text?.styles, styles, "Text has wrong styles after initialization")
    }

    func testInitWithEmptyStyles() {
        //Given
        let text = ControlStateText(value: value, styles: [:])
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
        let text = ControlStateText(value: value, style: style)
        //Then
        XCTAssertEqual(text.attributed, text.attributed(for: .normal), "Attributed must be equal to normal attributed string")
    }

    // MARK: - Attributes

    func testAttributesForDefaultState() {
        //Given

        //When
        let text = ControlStateText(value: value, style: style)
        //Then
        test(style.attributes, in: text, in: .init(location: 0, length: value.count))
    }

    func testAttributesForPassedState() {
        //Given
        let state = ControlState.random
        //When
        let text = ControlStateText(value: value, styles: [state: style])
        //Then
        test(style.attributes, in: text, for: state, in: .init(location: 0, length: value.count))
    }

    // MARK: - Substyles

    func testAddSubstyleForNormalState() {
        //Given
        let range = NSRange(location: 0, length: 2)
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
        let text = ControlStateText(value: value, styles: [state: style1])
        //When
        text.add(style2, at: range, for: state)
        //Then
        test(text, withValue: value, for: state, with: style1)
        test(style2.attributes, in: text, for: state, in: range)
    }

    func testAddSubstylesForDefaultState() {
        //Given
        let range2 = NSRange(location: 0, length: 2)
        let range3 = NSRange(location: 2, length: 2)
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
        let text = ControlStateText(value: value, styles: [state: style1])
        //When
        text.add(style2, at: range2, for: state)
        text.add(style3, at: range3, for: state)
        //Then
        test(text, withValue: value, for: state, with: style1)
        test(style2.attributes, in: text, for: state, in: range2)
        test(style3.attributes, in: text, for: state, in: range3)
    }

    // MARK: - Substrings

    func testAddSubstringForNormaDefaultState() {
        //Given
        let value1 = substring1 + value + substring1
        let text = ControlStateText(value: value1, style: style1)
        //When
        text.add(style2, for: substring1)
        //Then
        test(text, withValue: value1, for: .normal, with: style1)
        test(style2.attributes, in: text, for: .normal, withSubstring: substring1)
    }

    func testAddSubstringForPassedState() {
        //Given
        let value1 = substring1 + value + substring1
        let state = ControlState.random
        let text = ControlStateText(value: value1, styles: [state: style1])
        //When
        text.add(style2, for: substring1, for: state)
        //Then
        test(text, withValue: value1, for: state, with: style1)
        test(style2.attributes, in: text, for: state, withSubstring: substring1)
    }

    func testAddSubstringsForDefaultState() {
        //Given
        let value1 = substring1 + value + substring2
        let text = ControlStateText(value: value1, style: style)
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
        let text = ControlStateText(value: value1, styles: [state: style])
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

    // MARK: - Equality

    func testEquality() {
        //Given
        let text1 = Text(value: value, style: style1)
        let text2 = Text(value: value, style: style1.copy())
        //When

        //Then
        XCTAssertEqual(text1, text2, "Texts with the same values and styles should be equal")
    }

    func testEqualityWithDifferentValues() {
        //Given
        let text1 = Text(value: substring1, style: style1)
        let text2 = Text(value: substring2, style: style1.copy())
        //When

        //Then
        XCTAssertNotEqual(text1, text2, "Texts with different values should not be equal")
    }

    func testEqualityWithDifferentStyles() {
        //Given
        let text1 = Text(value: value, style: style1)
        let text2 = Text(value: value, style: style2)
        //When

        //Then
        XCTAssertNotEqual(text1, text2, "Texts with different styles should not be equal")
    }

    // MARK: - Bounding rect

    func testBoundingRectWithMaxSizeAndDefaultParameters() {
        //Given
        let options = BoundingRectOptions()
        //When
        let calculatedRect = text.boundingRect(with: options.size)
        //Then
        test(rect: calculatedRect, string: text.attributed, for: options)
    }

    func testBoundingRectWithConstrainedWidthAndDefaultParameters() {
        //Given
        let options = BoundingRectOptions(size: CGSize(width: 100, height: CGFloat.greatestFiniteMagnitude))
        //When
        let calculatedRect = text.boundingRect(with: options.size)
        //Then
        test(rect: calculatedRect, string: text.attributed, for: options)
    }

    func testBoundingRectWithConstrainedHeightAndDefaultParameters() {
        //Given
        let options = BoundingRectOptions(size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 5))
        //When
        let calculatedRect = text.boundingRect(with: options.size)
        //Then
        test(rect: calculatedRect, string: text.attributed, for: options)
    }

    func testBoundingRectWithCustomOptions() {
        //Given
        let options = BoundingRectOptions(options: [.usesFontLeading])
        //When
        let calculatedRect = text.boundingRect(with: options.size, options: options.options)
        //Then
        test(rect: calculatedRect, string: text.attributed, for: options)
    }

    func testBoundingRectWithCustomContext() {
        //Given
        let context = NSStringDrawingContext()
        context.minimumScaleFactor = 0.5
        let options = BoundingRectOptions(context: context)
        //When
        let calculatedRect = text.boundingRect(with: options.size, context: options.context)
        //Then
        test(rect: calculatedRect, string: text.attributed, for: options)
    }

    func testBoundingRectWithUnspecifiedState() {
        //Given
        let text = ControlStateText(value: value, styles: [.normal: style1])
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        //When
        let calculatedRect1 = text.boundingRect(with: size, for: .disabled)
        //Then
        XCTAssertEqual(calculatedRect1, .zero, "Text returns wrong bounding rect for unspecified state")
    }

    // MARK: - Operators

    func testTextAndStringConcatenation() {
        //Given
        let styles = self.styles
        let text = ControlStateText(value: substring1, styles: styles)
        //When
        let newText = text + substring2
        //Then
        XCTAssertEqual(newText.styles, styles, "Styles should be equal")
        XCTAssertEqual(newText.value, substring1 + substring2, "Strings should concatenated")
    }

    func testStringAndTextConcatenation() {
        //Given
        let styles = self.styles
        let text = ControlStateText(value: substring1, styles: styles)
        //When
        let newText = substring2 + text
        //Then
        XCTAssertEqual(newText.styles, styles, "Styles should be equal")
        XCTAssertEqual(newText.value, substring2 + substring1, "Strings should be concatenated")
    }

    func testTextAndTextConcatenation() {
        //Given
        let styles1 = styles
        let styles2 = styles
        let text1 = ControlStateText(value: substring1, styles: styles1)
        let text2 = ControlStateText(value: substring2, styles: styles2)
        //When
        let newText = text1 + text2
        //Then
        for (state, style) in styles1 {
            test(style.attributes, in: newText, for: state, withSubstring: substring1)
        }
        for (state, style) in styles2 {
            test(style.attributes, in: newText, for: state, withSubstring: substring2)
        }
    }

    func testTextAndTextWithSubstylesConcatenation() {
        //Given
        let styles1 = styles
        let styles2 = styles
        let text1 = ControlStateText(value: substring1 + substring2, styles: styles1)
        text1.add(style1, for: substring2)
        let text2 = ControlStateText(value: substring3 + substring4, styles: styles2)
        text2.add(style2, for: substring4)
        //When
        let newText = text1 + text2
        //Then
        for (state, style) in styles1 {
            test(style.attributes, in: newText, for: state, withSubstring: substring1)
        }
        test(style1.attributes, in: newText, for: .normal, withSubstring: substring2)
        for (state, style) in styles2 {
            test(style.attributes, in: newText, for: state, withSubstring: substring3)
        }
        test(style2.attributes, in: newText, for: .normal, withSubstring: substring4)
    }

    func testTextsWithIntersectValuesConcatenation() {
        //Given
        let styles1 = styles
        let styles2 = styles
        let text1 = ControlStateText(value: substring1 + substring2, styles: styles1)
        let text2 = ControlStateText(value: substring2 + substring3, styles: styles2)
        //When
        let newText = text1 + text2
        //Then
        for (state, style) in styles1 {
            test(style.attributes, in: newText, for: state, withSubstring: substring1)
        }
        let firstRange = NSRange(location: substring1.count, length: substring2.count)
        for (state, style) in styles1 {
            test(style.attributes, in: newText, for: state, in: firstRange)
        }
        for (state, style) in styles2 {
            test(style.attributes, in: newText, for: state, withSubstring: substring3)
        }
        let secondRange = NSRange(location: text1.value.count, length: substring2.count)
        for (state, style) in styles2 {
            test(style.attributes, in: newText, for: state, in: secondRange)
        }
    }

    func testTextAndTextWithConcatenation() {
        //Given
        let styles1 = styles
        let styles2 = styles
        let text1 = ControlStateText(value: substring1 + substring2, styles: styles1)
        text1.add(style1, for: substring2)
        let text2 = ControlStateText(value: substring3 + substring4, styles: styles2)
        text2.add(style2, for: substring4)
        //When
        let newText = text1 + text2
        //Then
        for (state, style) in styles1 {
            test(style.attributes, in: newText, for: state, withSubstring: substring1)
        }
        test(style1.attributes, in: newText, for: .normal, withSubstring: substring2)
        for (state, style) in styles2 {
            test(style.attributes, in: newText, for: state, withSubstring: substring3)
        }
        test(style2.attributes, in: newText, for: .normal, withSubstring: substring4)
    }

    func testEmptyArrayJoiningWithLeftStrategy() {
        //Given
        let texts = [ControlStateText]()
        //When
        let text = texts.joined(separator: "", strategy: .left)
        //Then
        let defaultText = ControlStateText(value: "", style: .init())
        XCTAssertEqual(text, defaultText, "Joining of array with no texts must return default text")
        XCTAssertTrue(text.substyles.isEmpty, "Joining of array with no texts must return the text without substyles")
    }

    func testOneTextArrayJoiningWithLeftStrategy() {
        //Given
        let styles1 = styles
        let text1 = ControlStateText(value: substring1, styles: styles1)
        let texts = [text1]
        //When
        let text = texts.joined(separator: "", strategy: .left)
        //Then
        XCTAssertTrue(text === text1, "Joining of array with one text must return the same text")
    }

    func testTextArrayJoiningWithDefaultStrategyForSeparator() {
        //Given
        let styles1 = styles
        let styles2 = styles
        let text1 = ControlStateText(value: substring1, styles: styles1)
        let text2 = ControlStateText(value: substring2, styles: styles2)
        let separator = " "
        let texts = [text1, text2]
        //When
        let text = texts.joined(separator: separator)
        //Then
        XCTAssertEqual(text.value, substring1 + separator + substring2, "Strings should be joined with separator")
        for state in ControlState.allCases {
            test(styles1[state]!.attributes, in: text, for: state, withSubstring: substring1)
            test(styles1[state]!.attributes, in: text, for: state, withSubstring: separator)
            test(styles2[state]!.attributes, in: text, for: state, withSubstring: substring2)
        }
    }

    func testTextArrayJoiningWithLeftStrategyForSeparator() {
        //Given
        let styles1 = styles
        let styles2 = styles
        let text1 = ControlStateText(value: substring1, styles: styles1)
        let text2 = ControlStateText(value: substring2, styles: styles2)
        let separator = " "
        let texts = [text1, text2]
        //When
        let text = texts.joined(separator: separator, strategy: .left)
        //Then
        XCTAssertEqual(text.value, substring1 + separator + substring2, "Strings should be joined with separator")
        for state in ControlState.allCases {
            test(styles1[state]!.attributes, in: text, for: state, withSubstring: substring1)
            test(styles1[state]!.attributes, in: text, for: state, withSubstring: separator)
            test(styles2[state]!.attributes, in: text, for: state, withSubstring: substring2)
        }
    }

    func testTextArrayJoiningWithRightStrategyForSeparator() {
        //Given
        let styles1 = styles
        let styles2 = styles
        let text1 = ControlStateText(value: substring1, styles: styles1)
        let text2 = ControlStateText(value: substring2, styles: styles2)
        let separator = " "
        let texts = [text1, text2]
        //When
        let text = texts.joined(separator: separator, strategy: .right)
        //Then
        XCTAssertEqual(text.value, substring1 + separator + substring2, "Strings should be joined with separator")
        for state in ControlState.allCases {
            test(styles1[state]!.attributes, in: text, for: state, withSubstring: substring1)
            test(styles2[state]!.attributes, in: text, for: state, withSubstring: separator)
            test(styles2[state]!.attributes, in: text, for: state, withSubstring: substring2)
        }
    }

    // MARK: - Interpolation

    func testStringInterpolation() {
        //Given
        let text = Text(value: value, style: style)
        //When
        let string = "\(text)"
        //Then
        XCTAssertEqual(string, value, "Text should be interpolated to its value")
    }

    // MARK: - Copying

    func testCopy() {
        //Given
        let text = ControlStateText(value: .random(length: 6), styles: styles)
        text.substyles = [.normal: [TextSubstyle.random, TextSubstyle.random]]
        //When
        let copy = text.copy()
        //Then
        XCTAssertFalse(copy === text, "Copy must be a different object instance.")
        XCTAssertEqual(copy, text, "Copy must be equal to text")
    }

    func testDictionaryCopy() {
        //Given
        let styles = self.styles
        //When
        let copy = styles.copy()
        //Then
        for (copy, style) in zip(copy.values, styles.values) {
            XCTAssertFalse(copy === style, "Copy must be a different object instance.")
            XCTAssertEqual(copy, style, "Copy must be equal to text")
        }
    }

    // MARK: - Private

    private func test(_ text: ControlStateText?, withValue value: String?, for state: ControlState, with style: TextStyle) {
        XCTAssertEqual(text?.value, value, "Text has wrong value after initialization")
        XCTAssertEqual(text?.styles.count, 1, "Text has wrong style after initialization")
        XCTAssertTrue(text?.styles[state] === style, "Text has wrong style for \(state) state after initialization")
    }

    private func test(_ attributes: TextStyleAttributes, in text: ControlStateText, for state: ControlState = .normal, in range: NSRange) {
        let string = text.attributed(for: state)
        XCTAssertNotNil(string, "String must not be nil")
        string?.enumerateAttributes(in: range, options: .longestEffectiveRangeNotRequired) { enumeratedAttributes, _, _ in
            for (key, attribute) in enumeratedAttributes {
                let message = "\(attribute) value must be equal to \(String(describing: attributes[key])) value for \(key.rawValue) key"
                XCTAssertTrue(isEqual(a: attribute, b: attributes[key], key: key), message)
            }
        }
    }

    private func test(_ attributes: TextStyleAttributes,
                      in text: ControlStateText,
                      for state: ControlState,
                      withSubstring substring: String) {
        var searchStartIndex = text.value.startIndex
        let endIndex = text.value.endIndex

        while searchStartIndex < endIndex, let range = text.value.range(of: substring, range: searchStartIndex..<endIndex),
            !range.isEmpty {
                let nsRange = NSRange(range, in: text.value)
                test(attributes, in: text, for: state, in: nsRange)
                searchStartIndex = range.upperBound
        }
    }
}
