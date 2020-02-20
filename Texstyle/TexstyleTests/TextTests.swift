//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class TextTests: XCTestCase {

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

    private lazy var text = Text(value: value, style: style1)

    private var styles: [ControlState: TextStyle] {
        var styles = [ControlState: TextStyle]()
        for state in ControlState.allCases {
            styles[state] = .random
        }
        return styles
    }

    // MARK: - Initialization

    func testStateInitWithValueAndStyle() {
        //Given

        //When
        let text = Text(value: value, style: style)
        let text2 = Text(value: value as String?, style: style)
        //Then
        test(text, withValue: value, with: style)
        test(text2, withValue: value, with: style)
    }

    func testInitWithValueAndStyle() {
        //Given

        //When
        let text = Text(value: value, style: style)
        //Then
        test(text, withValue: value, with: style)
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
        test(text, withValue: value, with: style)
    }

    func testInitWithValueAndStyles() {
        //Given
        let style = self.style
        //When
        let text = Text(value: value, style: style)
        //Then
        XCTAssertEqual(text.value, value, "Text has wrong value after initialization")
        XCTAssertEqual(text.style, style, "Text has wrong styles after initialization")
    }

    func testInitWithoutValueAndWithStyles() {
        //Given
        let style = self.style
        //When
        let text = Text(value: nil, style: style)
        //Then
        XCTAssertNil(text, "Text must be nil with nil value")
    }

    func testInitWithOptionalValueAndStyles() {
        //Given
        let value1: String? = value
        let style = self.style
        //When
        let text = Text(value: value1, style: style)
        //Then
        XCTAssertNotNil(text, "Text must not be nil with nil value")
        XCTAssertEqual(text?.value, value, "Text has wrong value after initialization")
        XCTAssertEqual(text?.style, style, "Text has wrong styles after initialization")
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

        //When
        let text = Text(value: value, style: style)
        //Then
        test(style.attributes, in: text, in: .init(location: 0, length: value.count))
    }

    // MARK: - Substyles

    func testAddSubstyleForNormalState() {
        //Given
        let range = NSRange(location: 0, length: 2)
        //When
        text.add(style2, at: range)
        //Then
        test(text, withValue: value, with: style1)
        test(style2.attributes, in: text, in: range)
    }

    func testAddSubstyleAtRangeForNormalState() {
        //Given
        let range = Range(NSRange(location: 0, length: 2), in: value)!
        //When
        text.add(style2, at: range)
        //Then
        test(text, withValue: value, with: style1)
        test(style2.attributes, in: text, in: NSRange(range, in: value))
    }

    func testAddSubstyleForPassedState() {
        //Given
        let range = NSRange(location: 0, length: 2)
        let text = Text(value: value, style: style1)
        //When
        text.add(style2, at: range)
        //Then
        test(text, withValue: value, with: style1)
        test(style2.attributes, in: text, in: range)
    }

    func testAddSubstylesForNormalState() {
        //Given
        let range2 = NSRange(location: 0, length: 2)
        let range3 = NSRange(location: 2, length: 2)
        //When
        text.add(style2, at: range2)
        text.add(style3, at: range3)
        //Then
        test(text, withValue: value, with: style1)
        test(style2.attributes, in: text, in: range2)
        test(style3.attributes, in: text, in: range3)
    }

    func testAddSubstylesForPassedState() {
        //Given
        let range2 = NSRange(location: 0, length: 2)
        let range3 = NSRange(location: 2, length: 2)
        let text = Text(value: value, style: style1)
        //When
        text.add(style2, at: range2)
        text.add(style3, at: range3)
        //Then
        test(text, withValue: value, with: style1)
        test(style2.attributes, in: text, in: range2)
        test(style3.attributes, in: text, in: range3)
    }

    // MARK: - Substrings

    func testAddSubstringForNormalState() {
        //Given
        let value1 = substring1 + value + substring1
        let text = Text(value: value1, style: style1)
        //When
        text.add(style2, for: substring1)
        //Then
        test(text, withValue: value1, with: style1)
        test(style2.attributes, in: text, withSubstring: substring1)
    }

    func testAddSubstringForPassedState() {
        //Given
        let value1 = substring1 + value + substring1
        let text = Text(value: value1, style: style1)
        //When
        text.add(style2, for: substring1)
        //Then
        test(text, withValue: value1, with: style1)
        test(style2.attributes, in: text, withSubstring: substring1)
    }

    func testAddSubstringsForNormalState() {
        //Given
        let value1 = substring1 + value + substring2
        let text = Text(value: value1, style: style)
        //When
        text.add(style1, for: substring1)
        text.add(style2, for: substring2)
        //Then
        test(text, withValue: value1, with: style)

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
        let text = Text(value: value1, style: style)
        //When
        text.add(style1, for: substring1)
        text.add(style2, for: substring2)
        //Then
        test(text, withValue: value1, with: style)

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

    // MARK: - Operators

    func testTextAndStringConcatenation() {
        //Given
        let style = self.style
        let text = Text(value: substring1, style: style)
        //When
        let newText = text + substring2
        //Then
        XCTAssertEqual(newText.style, style, "Styles should be equal")
        XCTAssertEqual(newText.value, substring1 + substring2, "Strings should concatenated")
    }

    func testStringAndTextConcatenation() {
        //Given
        let style = self.style
        let text = Text(value: substring1, style: style)
        //When
        let newText = substring2 + text
        //Then
        XCTAssertEqual(newText.style, style, "Styles should be equal")
        XCTAssertEqual(newText.value, substring2 + substring1, "Strings should be concatenated")
    }

    func testTextAndTextConcatenation() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1, style: style1)
        let text2 = Text(value: substring2, style: style2)
        //When
        let newText = text1 + text2
        //Then
        XCTAssertEqual(newText.value, substring1 + substring2, "Strings should be concatenated")
        test(style1.attributes, in: newText, withSubstring: substring1)
//        test(style2.attributes, in: newText, withSubstring: substring2)
    }

    func testTextAndTextWithSubstylesConcatenation() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1 + substring2, style: style1)
        text1.add(style1, for: substring2)
        let text2 = Text(value: substring3 + substring4, style: style2)
        text2.add(style2, for: substring4)
        //When
        let newText = text1 + text2
        //Then
        test(style1.attributes, in: newText, withSubstring: substring1)
        test(style1.attributes, in: newText, withSubstring: substring2)
        test(style2.attributes, in: newText, withSubstring: substring3)
        test(style2.attributes, in: newText, withSubstring: substring4)
    }

    func testTextsWithIntersectValuesConcatenation() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1 + substring2, style: style1)
        let text2 = Text(value: substring2 + substring3, style: style2)
        //When
        let newText = text1 + text2
        //Then
        test(style1.attributes, in: newText, withSubstring: substring1)
        let firstRange = NSRange(location: substring1.count, length: substring2.count)
        test(style1.attributes, in: newText, in: firstRange)
        test(style2.attributes, in: newText, withSubstring: substring3)
        let secondRange = NSRange(location: text1.value.count, length: substring2.count)
        test(style2.attributes, in: newText, in: secondRange)
    }

    func testTextAndTextWithConcatenation() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1 + substring2, style: style1)
        text1.add(style1, for: substring2)
        let text2 = Text(value: substring3 + substring4, style: style2)
        text2.add(style2, for: substring4)
        //When
        let newText = text1 + text2
        //Then
        test(style1.attributes, in: newText, withSubstring: substring1)
        test(style1.attributes, in: newText, withSubstring: substring2)
        test(style2.attributes, in: newText, withSubstring: substring3)
        test(style2.attributes, in: newText, withSubstring: substring4)
    }

    func testTextArrayJoiningWithOneText() {
        //Given
        let style1 = style
        let text1 = Text(value: substring1, style: style1)
        let texts = [text1]
        //When
        let text = texts.joined()
        //Then
        XCTAssertTrue(text === text1, "Joining of array with one text must return the same text")
    }

    func testTextArrayJoiningWithDefaultSeparator() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1, style: style1)
        let text2 = Text(value: substring2, style: style2)
        let texts = [text1, text2]
        //When
        let text = texts.joined()!
        //Then
        XCTAssertEqual(text.value, substring1 + substring2, "Strings should be joined")
        test(style1.attributes, in: text, withSubstring: substring1)
        test(style2.attributes, in: text, withSubstring: substring2)
    }

    func testTextArrayJoiningWithoutElements() {
        //Given
        let texts = [Text]()
        //When
        let text = texts.joined()
        //Then
        XCTAssertNil(text, "Text should be nil")
    }

    func testTextArrayJoiningWithOneElement() {
        //Given
        let text1 = Text(value: substring1, style: style)
        //When
        let text = [text1].joined()
        //Then
        XCTAssertEqual(text, text1, "Strings should be joined")
    }

    func testTextArrayJoiningWithCustomSeparator() {
        //Given
        let style1 = style
        let style2 = style
        let style3 = style
        let text1 = Text(value: substring1, style: style1)
        let text2 = Text(value: substring2, style: style2)
        let separatorText = Text(value: substring3, style: style3)
        let texts = [text1, text2]
        //When
        let text = texts.joined(separatorText: separatorText)!
        //Then
        XCTAssertEqual(text.value, substring1 + substring3 + substring2, "Strings should be joined with \(substring3) separator")
        test(style1.attributes, in: text, withSubstring: substring1)
        test(style2.attributes, in: text, withSubstring: substring2)
        test(style3.attributes, in: text, withSubstring: substring3)
    }

    func testEmptyArrayJoiningWithLeftStrategy() {
        //Given
        let texts = [Text]()
        //When
        let text = texts.joined(separator: "", strategy: .left)
        //Then
        let defaultText = Text(value: "", style: .init())
        XCTAssertEqual(text, defaultText, "Joining of array with no texts must return default text")
        XCTAssertTrue(text.substyles.isEmpty, "Joining of array with no texts must return the text without substyles")
    }

    func testOneTextArrayJoiningWithLeftStrategy() {
        //Given
        let style1 = style
        let text1 = Text(value: substring1, style: style1)
        let texts = [text1]
        //When
        let text = texts.joined(separator: "", strategy: .left)
        //Then
        XCTAssertTrue(text === text1, "Joining of array with one text must return the same text")
    }

    func testTextArrayJoiningWithDefaultStrategyForSeparator() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1, style: style1)
        let text2 = Text(value: substring2, style: style2)
        let separator = " "
        let texts = [text1, text2]
        //When
        let text = texts.joined(separator: separator)
        //Then
        XCTAssertEqual(text.value, substring1 + separator + substring2, "Strings should be joined with separator")
        test(style1.attributes, in: text, withSubstring: substring1)
        test(style1.attributes, in: text, withSubstring: separator)
        test(style2.attributes, in: text, withSubstring: substring2)
    }

    func testTextArrayJoiningWithLeftStrategyForSeparator() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1, style: style1)
        let text2 = Text(value: substring2, style: style2)
        let separator = " "
        let texts = [text1, text2]
        //When
        let text = texts.joined(separator: separator, strategy: .left)
        //Then
        XCTAssertEqual(text.value, substring1 + separator + substring2, "Strings should be joined with separator")
        test(style1.attributes, in: text, withSubstring: substring1)
        test(style1.attributes, in: text, withSubstring: separator)
        test(style2.attributes, in: text, withSubstring: substring2)
    }

    func testTextArrayJoiningWithRightStrategyForSeparator() {
        //Given
        let style1 = style
        let style2 = style
        let text1 = Text(value: substring1, style: style1)
        let text2 = Text(value: substring2, style: style2)
        let separator = " "
        let texts = [text1, text2]
        //When
        let text = texts.joined(separator: separator, strategy: .right)
        //Then
        XCTAssertEqual(text.value, substring1 + separator + substring2, "Strings should be joined with separator")
        test(style1.attributes, in: text, withSubstring: substring1)
        test(style2.attributes, in: text, withSubstring: separator)
        test(style2.attributes, in: text, withSubstring: substring2)
    }

    // MARK: - Interpolation

    func testTextInterpolation() {
        //Given
        let text = Text(value: value, style: style)
        //When
        let string = "\(text)"
        //Then
        XCTAssertEqual(string, value, "Text should be interpolated to its value")
    }

    func testControlStateTextInterpolation() {
        //Given
        let text = ControlStateText(value: value, style: style)
        //When
        let string = "\(text)"
        //Then
        XCTAssertEqual(string, value, "Text should be interpolated to its value")
    }

    // MARK: - Copying

    func testCopy() {
        //Given
        let text = Text(value: .random(length: 6), style: style)
        text.substyles = [TextSubstyle.random, TextSubstyle.random]
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

    private func test(_ text: Text?, withValue value: String?, with style: TextStyle) {
        XCTAssertEqual(text?.value, value, "Text has wrong value after initialization")
        XCTAssertTrue(text?.style === style, "Text has wrong style after initialization")
    }

    private func test(_ attributes: TextStyleAttributes, in text: Text, in range: NSRange) {
        let string = text.attributed
        XCTAssertNotNil(string, "String must not be nil")
        string.enumerateAttributes(in: range, options: .longestEffectiveRangeNotRequired) { enumeratedAttributes, _, _ in
            for (key, attribute) in enumeratedAttributes {
                let message = "\(attribute) value must be equal to \(String(describing: attributes[key])) value for \(key.rawValue) key"
                XCTAssertTrue(isEqial(a: attribute, b: attributes[key], key: key), message)
            }
        }
    }

    private func test(_ attributes: TextStyleAttributes, in text: Text, withSubstring substring: String) {
        var searchStartIndex = text.value.startIndex
        let endIndex = text.value.endIndex

        while searchStartIndex < endIndex, let range = text.value.range(of: substring, range: searchStartIndex..<endIndex),
            !range.isEmpty {
                let nsRange = NSRange(range, in: text.value)
                test(attributes, in: text, in: nsRange)
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

    private func test(rect: CGRect, string: NSAttributedString?, for options: BoundingRectOptions) {
        //Given

        //When
        let calculatedRect = string?.boundingRect(with: options.size,
                                                  options: options.options,
                                                  context: options.context)
        //Then
        XCTAssertEqual(rect, calculatedRect, "Text returns wrong bounding rect for options: \(options)")
    }
}

private func isEqual<T: Equatable>(type: T.Type, a: Any?, b: Any?) -> Bool {
    a as? T == b as? T
}
