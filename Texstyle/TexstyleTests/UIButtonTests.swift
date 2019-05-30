//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class UIButtonTests: XCTestCase {

    func testText() {
        //Given
        var styles = [ControlState: TextStyle]()
        for state in ControlState.allCases {
            styles[state] = .random
        }
        let text = Text(value: "", styles: styles)
        let button = UIButton()
        //When
        button.setText(text)
        //Then
        for state in styles.keys {
            let message = "Button attributed title is not equal to text's attributed string for \(state) state"
            XCTAssertEqual(button.attributedTitle(for: state), text.attributed(for: state), message)
        }
    }
}
