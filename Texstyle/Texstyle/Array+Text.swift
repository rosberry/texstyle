//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public extension Array where Element: Text {

    func joined(separatorText: Text = Text(value: "", style: .init())) -> Text {
        let initialText = Text(value: "", style: .init())
        return self.reduce(initialText) { result, element in
            if result == initialText {
                return result + element
            }
            return result + separatorText + element
        }
    }
}
