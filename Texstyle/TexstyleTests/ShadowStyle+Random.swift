//
//  Copyright © 2019 Rosberry. All rights reserved.
//

@testable import Texstyle

extension ShadowStyle {

    static var random: ShadowStyle {
        let style = ShadowStyle()
        style.radius = .random(in: 0...10)
        style.offset = CGSize(width: .random(in: 0...10),
                              height: .random(in: 0...10))
        style.color = .random
        return style
    }
}
