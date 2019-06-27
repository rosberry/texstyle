//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Texstyle

extension TextStyle {

    static let title1: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 32, weight: .regular)
        return style
    }()
        
    static let heading1: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 28, weight: .semibold)
        style.color = .purple
        return style
    }()
        
    static let heading2: TextStyle = {
        let style = heading1
        style.color = .blue
        return style
    }()

    static let paragraph1: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 24, weight: .thin)
        return style
    }()
        
    static let paragraph2: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 18, weight: .thin)
        style.underlineLine = .init()
        style.color = .blue
        return style
    }()

    static let substyle1: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 20, weight: .thin)
        style.backgroundColor = .red
        style.strikeThroughLine = .init()
        return style
    }()

    static let substyle2: TextStyle = {
        let style = TextStyle()
        style.font = .systemFont(ofSize: 26, weight: .bold)
        style.underlineLine = .init()
        style.color = .magenta
        style.backgroundColor = .cyan
        return style
    }()

    static let substyle3: TextStyle = {
        let style = TextStyle()
        style.font = .italicSystemFont(ofSize: 32)
        style.strokeWidth = 3
        return style
    }()
}
