//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol BaseText {

    var value: String { get }

    func concat(_ text: Self) -> Self
}
