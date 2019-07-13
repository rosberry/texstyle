//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension Array where Element: Text {

    func joined(separatorText: Text? = nil) -> Text {
        if isEmpty {
            return Text(value: "", style: .init())
        }
        if count == 1 {
            return self[0]
        }
        var text: Text = self[0]
        for index in 1..<count {
            //swiftlint:disable shorthand_operator
            if let separatorText = separatorText {
                text = text + separatorText + self[index]
            }
            else {
                text = text + self[index]
            }
            //swiftlint:enable shorthand_operator
        }
        return text
    }
}
