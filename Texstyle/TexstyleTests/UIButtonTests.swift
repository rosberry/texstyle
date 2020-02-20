//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import XCTest
@testable import Texstyle

final class UIButtonTests: XCTestCase {

    private lazy var substring: String = .random(length: 6)

    func testSetTextForPassedState() {
        //Given
        let state: ControlState = .random
        let text = Text(value: substring, style: .random)
        let button = UIButton()
        //When
        button.setText(text, for: state)
        //Then
        let message = "Button attributed title must be equal to text's attributed string for state \(state)"
        XCTAssertEqual(button.attributedTitle(for: state), text.attributed, message)
    }

    func testTextForDefaultState() {
        //Given
        let text = Text(value: substring, style: .random)
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
        let text = ControlStateText(value: substring, styles: [state: .random])
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
        let text = Text(value: substring, style: .random)
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
        let states = ControlState.allCases
        let texts = states.map { _ in
            Text(value: .random(length: 6), style: .random)
        }
        let statedTexts = Dictionary(uniqueKeysWithValues: zip(states, texts))
        let button = UIButton()
        //When
        button.setTexts(statedTexts)
        //Then
        for (state, text) in statedTexts {
            let message = "Button attributed title must be equal to text's attributed string for state \(state)"
            XCTAssertEqual(button.attributedTitle(for: state), text.attributed, message)
        }
    }
}
