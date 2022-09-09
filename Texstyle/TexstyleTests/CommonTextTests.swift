//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import XCTest
import Foundation
@testable import Texstyle

class CommonTextTests: XCTestCase {

    //swiftlint:disable:next cyclomatic_complexity
    func isEqual(a: Any?, b: Any?, key: Texstyle.AttributedStringKey) -> Bool {
        if key == .font {
            return TextStyleTests.isEqual(type: UIFont.self, a: a, b: b)
        }
        if key == .paragraphStyle {
            return TextStyleTests.isEqual(type: NSParagraphStyle.self, a: a, b: b)
        }
        if key == .foregroundColor {
            return TextStyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .backgroundColor {
            return TextStyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .ligature {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .kern {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .strikethroughStyle {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .underlineStyle {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .strokeColor {
            return TextStyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .strokeWidth {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .shadow {
            return TextStyleTests.isEqual(type: NSShadow.self, a: a, b: b)
        }
        if key == .textEffect {
            return TextStyleTests.isEqual(type: NSString.self, a: a, b: b)
        }
        if key == .attachment {
            return TextStyleTests.isEqual(type: NSTextAttachment.self, a: a, b: b)
        }
        if key == .link {
            return TextStyleTests.isEqual(type: NSURL.self, a: a, b: b) || TextStyleTests.isEqual(type: NSString.self, a: a, b: b)
        }
        if key == .baselineOffset {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .underlineColor {
            return TextStyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .strikethroughColor {
            return TextStyleTests.isEqual(type: UIColor.self, a: a, b: b)
        }
        if key == .obliqueness {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        if key == .expansion {
            return TextStyleTests.isEqual(type: NSNumber.self, a: a, b: b)
        }
        return false
    }

    func test(rect: CGRect, string: NSAttributedString?, for options: BoundingRectOptions) {
        //Given

        //When
        let calculatedRect = string?.boundingRect(with: options.size,
                                                  options: options.options,
                                                  context: options.context)
        //Then
        XCTAssertEqual(rect, calculatedRect, "Text returns wrong bounding rect for options: \(options)")
    }
}
