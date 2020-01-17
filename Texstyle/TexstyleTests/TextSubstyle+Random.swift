//
//  Copyright © 2019 Rosberry. All rights reserved.
//

@testable import Texstyle

extension TextSubstyle {

    static var random: TextSubstyle {
        let randomRange = NSRange(location: .random(in: 0...6), length: .random(in: 0...6))
        return TextSubstyle(style: .random, range: randomRange, state: .random)
    }
}
