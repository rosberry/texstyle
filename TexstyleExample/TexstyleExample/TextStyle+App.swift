//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Texstyle

extension TextStyle {

    static let title1: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 32, weight: .regular)
        style.lineHeight = 16
        return style
    }()
        
    static let heading1: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 28, weight: .semibold)
        style.color = .purple
        style.lineHeight = 16
        return style
    }()
        
    static let heading2: TextStyle = {
        let style = heading1
        style.color = .blue
        return style
    }()

    static let paragraph1: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 18, weight: .thin)
        style.lineHeight = 18
        return style
    }()
        
    static let paragraph2: TextStyle = {
        let style = TextStyle()
        style.underlineLine = .init()
        style.color = .blue
        return style
    }()
}
