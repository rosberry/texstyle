//
//  Copyright © 2019 Rosberry. All rights reserved.
//

@testable import Texstyle

extension TextStyle {

    static var random: TextStyle {
        let style = TextStyle()
        style.font = .systemFont(ofSize: .random(in: 13...16))
        style.color = .random
        style.backgroundColor = .random
        style.ligature = .random(in: 0...1)
        style.kerning = .random(in: 0...10)
        style.strokeWidth = .random(in: 0...10)
        style.shadowStyle = .random
        style.baselineOffset = .random(in: 0...10)
        style.obliqueness = .random(in: 0...10)
        style.expansion = .random(in: 0...10)
        style.strikeThroughLine = .random
        style.underlineLine = .random
        style.strokeColor = .random
        style.effectStyle = .letterpressStyle
        let attachment = NSTextAttachment()
        attachment.image = UIImage()
        style.attachment = attachment
        style.alignment = .random
        style.lineBreakMode = .random
        style.lineSpacing = .random(in: 0...10)
        style.paragraphSpacing = .random(in: 0...10)
        style.paragraphSpacingBefore = .random(in: 0...10)
        style.lineHeight = .random(in: 0...10)
        style.link = .random
        return style
    }
}

extension UIColor {

    static var random: UIColor {
        return .init(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1),
                     alpha: .random(in: 0...1))
    }
}

private extension NSTextAlignment {

    static let allCases: [NSTextAlignment] = [.left, .center, .right, .justified, .natural]

    static var random: NSTextAlignment {
        return allCases.randomElement()!
    }
}

private extension NSLineBreakMode {

    static let allCases: [NSLineBreakMode] = [.byWordWrapping,
                                              .byCharWrapping,
                                              .byClipping,
                                              .byTruncatingHead,
                                              .byTruncatingTail,
                                              .byTruncatingMiddle]

    static var random: NSLineBreakMode {
        return allCases.randomElement()!
    }
}

private extension LineAttributes {

    static var random: LineAttributes {
        return .init(style: .random, color: .random)
    }
}

private extension NSUnderlineStyle {

    static let allCases: [NSUnderlineStyle] = [.single,
                                               .thick,
                                               .double,
                                               .patternDot,
                                               .patternDash,
                                               .patternDashDot,
                                               .patternDashDotDot,
                                               .byWord]

    static var random: NSUnderlineStyle {
        return allCases.randomElement()!
    }
}

extension NSParagraphStyle {

    static var random: NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .random
        paragraphStyle.lineBreakMode = .random
        paragraphStyle.lineSpacing = .random(in: 0...10)
        paragraphStyle.paragraphSpacing = .random(in: 0...10)
        paragraphStyle.paragraphSpacingBefore = .random(in: 0...10)
        paragraphStyle.minimumLineHeight = .random(in: 0...10)
        paragraphStyle.maximumLineHeight = .random(in: 0...10)
        return paragraphStyle
    }
}

private extension NSURL {

    private static let urls: [String] = ["http://www.google.com",
                                         "https://github.com",
                                         "http://stackoverflow.com",
                                         "https://medium.com"]

    static var random: NSURL? {
        return NSURL(string: urls.randomElement()!)
    }
}
