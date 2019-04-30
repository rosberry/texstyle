//
//  Copyright © 2019 Rosberry. All rights reserved.
//

extension String {

    static func random(length: Int) -> String {
        let symbols = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).compactMap { _ in symbols.randomElement() })
    }
}
