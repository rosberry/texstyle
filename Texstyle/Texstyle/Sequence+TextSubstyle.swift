//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Foundation

extension Sequence where Element: TextSubstyle {

    func copy() -> [TextSubstyle] {
        return self.map { substyle in
            substyle.copy()
        }
    }
}
