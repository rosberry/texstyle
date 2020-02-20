//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class UIButtonTests: XCTestCase {

    func testText() {
        //Given
        let style: TextStyle = .random
        let state: ControlState = .random
        let text = Text(value: "", style: style)
        let button = UIButton()
        //When
        button.setText(text, for: state)
        //Then
        let message = "Button attributed title must be equal to text's attributed string for state \(state)"
        XCTAssertEqual(button.attributedTitle(for: state), text.attributed, message)
    }

    func testControlStateText() {
        //Given
        let state: ControlState = .random
        let text = ControlStateText(value: "", styles: [state: .random])
        let button = UIButton()
        //When
        button.setText(text)
        //Then
        let message = "Button attributed title must be equal to text's attributed string for state \(state)"
        XCTAssertEqual(button.attributedTitle(for: state), text.attributed(for: state), message)
    }

    func testTextForDefaultState() {
        //Given
        let style: TextStyle = .random
        let text = Text(value: "", style: style)
        let button = UIButton()
        //When
        button.setText(text)
        //Then
        let message = "Button attributed title must be equal to text's attributed string"
        XCTAssertEqual(button.attributedTitle(for: .normal), text.attributed, message)
    }

    func testTextForSomeStates() {
        //Given
        let style: TextStyle = .random
        let states: [ControlState] = [.focused, .disabled]
        let text = Text(value: "", style: style)
        let button = UIButton()
        //When
        button.setText(text, for: states)
        //Then
        for state in states {
            let message = "Button attributed title must be equal to text's attributed string for state \(state)"
            XCTAssertEqual(button.attributedTitle(for: state), text.attributed, message)
        }
    }

    func testTextsForSomeStates() {
        //Given
        let style1: TextStyle = .random
        let style2: TextStyle = .random
        let texts: [ControlState: Text] = [.focused: .init(value: "", style: style1),
                                           .disabled: .init(value: "", style: style2)]
        let button = UIButton()
        //When
        button.setTexts(texts)
        //Then
        for (state, text) in texts {
            let message = "Button attributed title must be equal to text's attributed string for state \(state)"
            XCTAssertEqual(button.attributedTitle(for: state), text.attributed, message)
        }
    }
}
