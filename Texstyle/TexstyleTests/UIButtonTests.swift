//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class UIButtonTests: XCTestCase {

    private lazy var substring1: String = .random(length: 6)
    private lazy var substring2: String = .random(length: 6)

    func testSetTextForPassedState() {
        //Given
        let state: ControlState = .random
        let text = Text(value: substring1, style: .random)
        let button = UIButton()
        //When
        button.setText(text, for: state)
        //Then
        let message = "Button attributed title must be equal to text's attributed string for state \(state)"
        XCTAssertEqual(button.attributedTitle(for: state), text.attributed, message)
    }

    func testTextForDefaultState() {
        //Given
        let text = Text(value: substring1, style: .random)
        let button = UIButton()
        //When
        button.setText(text)
        //Then
        let message = "Button attributed title must be equal to text's attributed string"
        XCTAssertEqual(button.attributedTitle(for: .normal), text.attributed, message)
    }

    func testSetControlStateText() {
        //Given
        let state: ControlState = .random
        let text = ControlStateText(value: substring1, styles: [state: .random])
        let button = UIButton()
        //When
        button.setText(text)
        //Then
        let message = "Button attributed title must be equal to text's attributed string for state \(state)"
        XCTAssertEqual(button.attributedTitle(for: state), text.attributed(for: state), message)
    }

    func testTextForSomeStates() {
        //Given
        let states: [ControlState] = [.random, .random]
        let text = Text(value: substring1, style: .random)
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
        let texts: [ControlState: Text] = [.random: .init(value: substring1, style: .random),
                                           .random: .init(value: substring2, style: .random)]
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
