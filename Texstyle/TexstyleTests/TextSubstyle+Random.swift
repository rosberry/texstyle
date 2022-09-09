//
//  Copyright © 2019 Rosberry. All rights reserved.
//

@testable import Texstyle
import Foundation

extension TextSubstyle {

    static var random: TextSubstyle {
        let randomRange = NSRange(location: .random(in: 0...6), length: .random(in: 0...6))
        return TextSubstyle(style: .random, range: randomRange)
    }
}
