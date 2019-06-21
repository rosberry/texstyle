//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension Array where Element: Text {

    func joined(separator: String = "") -> Text {
        let value = self.map { text in
            return text.value
        }
        .joined(separator: separator)
        var mainText = Text(value: value, style: .init())
        self.forEach { text in
            mainText += text
        }
        return mainText
    }
}
