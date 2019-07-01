//
//  Copyright © 2019 Rosberry. All rights reserved.
//

extension Text: Equatable {

    public static func == (lhs: Text, rhs: Text) -> Bool {
        return lhs.value == rhs.value && lhs.styles == rhs.styles
    }
}
