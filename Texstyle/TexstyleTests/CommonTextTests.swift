//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import XCTest
import Foundation
@testable import Texstyle

class CommonTextTests: XCTestCase {

    //swiftlint:disable:next cyclomatic_complexity
    func isEqual(a: Any?, b: Any?, key: AttributedStringKey) -> Bool {
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

private func isEqual<T: Equatable>(type: T.Type, a: Any?, b: Any?) -> Bool {
    a as? T == b as? T
}
