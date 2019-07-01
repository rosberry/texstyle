//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension Array where Element: Text {

    func joined(separatorText: Text = Text(value: "", style: .init())) -> Text {
        if isEmpty {
            return Text(value: "", style: .init())
        }
        if count == 1 {
            return self[0]
        }
        var firstText: Text = self[0]
        for index in 1...(count - 1) {
            //swiftlint:disable:next shorthand_operator
            firstText = firstText + separatorText + self[index]
        }
        return firstText
    }
}
