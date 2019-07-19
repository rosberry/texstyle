//
//  Copyright © 2019 Rosberry. All rights reserved.
//

@testable import Texstyle
import UIKit

struct BoundingRectOptions {

    let size: CGSize
    let options: NSStringDrawingOptions
    let context: NSStringDrawingContext?
    let state: ControlState

    init(size: CGSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
         options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading],
         context: NSStringDrawingContext? = nil,
         state: ControlState = .normal) {
        self.size = size
        self.options = options
        self.context = context
        self.state = state
    }
}
