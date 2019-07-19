//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

#if swift(>=4.2)
    typealias AttributedStringKey = NSAttributedString.Key
#else
    typealias AttributedStringKey = NSAttributedStringKey
#endif

typealias TextStyleAttributes = [AttributedStringKey: Any]

/// Generates attributes according to stored parameters.
open class TextStyle {

    /// Use this attribute to change the font for a range of text.
    /// If you do not specify this attribute, the string uses a 12-point system font by default.
    public var font: UIFont = .systemFont(ofSize: 12) {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this attribute to specify the color of the text during rendering.
    /// If you do not specify this attribute, the text is rendered in black.
    public var color: UIColor = .black {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this attribute to specify the color of the background area behind the text.
    /// If you do not specify this attribute, no background color is drawn.
    public var backgroundColor: UIColor = .clear {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Ligatures cause specific character combinations to be rendered using a single custom glyph
    /// that corresponds to those characters. The value 0 indicates no ligatures. The value 1 indicates
    /// the use of the default ligatures.
    public var ligature: Int? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// This value specifies the number of points by which to adjust kern-pair characters.
    /// Kerning prevents unwanted space from occurring between specific characters and depends on the font.
    /// The value 0 means kerning is disabled. If you do not specify this attribute, the string uses zero kerning.
    public var kerning: Float? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// This value represents the amount to change the stroke width and is specified as a percentage of the font point size.
    /// Specify 0 (the default) for no additional changes. Specify positive values to change the stroke width alone.
    /// Specify negative values to stroke and fill the text. For example, a typical value for outlined text would be 3.0.
    public var strokeWidth: Float? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this style to specify the shadow.
    public var shadowStyle: ShadowStyle? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this attribute to specify a text effect, such as letterpressStyle.
    /// If you do not specify this attribute, the string uses has no text effect.
    public var effectStyle: NSAttributedString.TextEffectStyle? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this attribute to specify the character’s offset from the baseline, in points.
    /// If you do not specify this attribute, the string uses zero baseline offset.
    public var baselineOffset: Float? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this attribute to specify a skew to be applied to glyphs.
    /// If you do not specify this attribute, the string uses zero obliqueness, indicating no skew.
    public var obliqueness: Float? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this attribute to specify a log of the expansion factor to be applied to glyphs.
    /// If you do not specify this attribute, the string uses zero expansion.
    public var expansion: Float? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// This value indicates whether the text has a line through it.
    /// The default value for this attributes is styleNone for the style nil for the color, indicating same as foreground color.
    public var strikeThroughLine: LineAttributes? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// This value indicates whether the text is underlined.
    // The default values for this attributes are styleNone for the style and nil for the color, indicating same as foreground color.
    public var underlineLine: LineAttributes? {
        didSet {
            cachedAttributes = nil
        }
    }

    // If it is not defined (which is the case by default), it is assumed to be the same as the value of foregroundColor;
    /// otherwise, it describes the outline color.
    public var strokeColor: UIColor? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// The default value of this property is nil, indicating no attachment.
    public var attachment: NSTextAttachment? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// The default value of this property is nil, indicating no link.
    public var link: NSURL? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Natural text alignment is realized as left or right alignment depending on the line sweep direction
    /// of the first script contained in the paragraph. For a list of alignment constants,
    /// see the “Constants” section of NSString UIKit Additions Reference.
    public var alignment: NSTextAlignment? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// This property contains the line break mode to be used laying out the paragraph’s text.
    /// For a list of line break constants, see the “Constants” section of NSParagraphStyle.
    public var lineBreakMode: NSLineBreakMode? {
        didSet {
            cachedAttributes = nil
        }
    }
    /// This value is always nonnegative. This value is included in the line fragment heights in the layout manager.
    public var lineSpacing: Float? {
        didSet {
            cachedAttributes = nil
        }
    }
    /// This property contains the space (measured in points) added at the end of the paragraph to separate it from the following paragraph.
    /// This value must be nonnegative. The space between paragraphs is determined
    /// by adding the previous paragraph’s paragraphSpacing and the current paragraph’s paragraphSpacingBefore.
    public var paragraphSpacing: Float? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// This property contains the space (measured in points) between the paragraph’s top and the beginning of its text content.
    /// If you do not specify this attribute, the string uses zero paragraph spacing before.
    public var paragraphSpacingBefore: Float? {
        didSet {
            cachedAttributes = nil
        }
    }
    /// This property contains the minimum and maximum height in points that any line in the receiver will occupy,
    /// regardless of the font size or size of any attached graphic. This value must be nonnegative.
    public var lineHeight: Float? {
        didSet {
            cachedAttributes = nil
        }
    }

    /// Use this attribute to apply multiple attributes to a range of text. If you do not specify this attribute,
    /// the string uses the default paragraph attributes, as returned by the default method of NSParagraphStyle.
    public var paragraphStyle: NSParagraphStyle? {
        didSet {
            cachedAttributes = nil
        }
    }

    private var cachedAttributes: TextStyleAttributes?

    /// The attributes according to stored parameters. Returns cached attributes if possible.
    var attributes: TextStyleAttributes {
        if let cachedAttributes = cachedAttributes {
            return cachedAttributes
        }

        var attributes: TextStyleAttributes = [:]
        attributes[.font] = font
        attributes[.foregroundColor] = color
        attributes[.backgroundColor] = backgroundColor
        if let ligature = ligature {
            attributes[.ligature] = ligature
        }
        if let kerning = kerning {
            attributes[.kern] = kerning
        }
        if let strokeWidth = strokeWidth {
            attributes[.strokeWidth] = strokeWidth
        }
        if let shadowStyle = shadowStyle {
            attributes[.shadow] = shadowStyle.shadow
        }
        if let effectStyle = effectStyle {
            attributes[.textEffect] = effectStyle
        }
        if let baselineOffset = baselineOffset {
            attributes[.baselineOffset] = baselineOffset
        }
        if let obliqueness = obliqueness {
            attributes[.obliqueness] = obliqueness
        }
        if let expansion = expansion {
            attributes[.expansion] = expansion
        }
        if let strikeThroughLine = strikeThroughLine {
            attributes[.strikethroughStyle] = strikeThroughLine.style.rawValue
            attributes[.strikethroughColor] = strikeThroughLine.color
        }
        if let underlineLine = underlineLine {
            attributes[.underlineStyle] = underlineLine.style.rawValue
            attributes[.underlineColor] = underlineLine.color
        }
        if let strokeColor = strokeColor {
            attributes[.strokeColor] = strokeColor
        }
        if let attachment = attachment {
            attributes[.attachment] = attachment
        }
        if let link = link {
            attributes[.link] = link
        }

        if paragraphStyle == nil {
            let paragraphStyle = NSMutableParagraphStyle()
            if let alignment = alignment {
                paragraphStyle.alignment = alignment
            }
            if let lineBreakMode = lineBreakMode {
                paragraphStyle.lineBreakMode = lineBreakMode
            }
            if let lineSpacing = lineSpacing {
                paragraphStyle.lineSpacing = CGFloat(lineSpacing)
            }
            if let paragraphSpacing = paragraphSpacing {
                paragraphStyle.paragraphSpacing = CGFloat(paragraphSpacing)
            }
            if let paragraphSpacingBefore = paragraphSpacingBefore {
                paragraphStyle.paragraphSpacingBefore = CGFloat(paragraphSpacingBefore)
            }
            if let lineHeight = lineHeight {
                paragraphStyle.minimumLineHeight = CGFloat(lineHeight)
                paragraphStyle.maximumLineHeight = CGFloat(lineHeight)
            }
            attributes[.paragraphStyle] = paragraphStyle
        }
        else {
            attributes[.paragraphStyle] = paragraphStyle
        }

        cachedAttributes = attributes
        return attributes
    }

    public init() {
    }

    public func copy() -> TextStyle {
        let copy = TextStyle()
        copy.font = font
        copy.color = color
        copy.backgroundColor = backgroundColor
        copy.ligature = ligature
        copy.kerning = kerning
        copy.strokeWidth = strokeWidth
        copy.shadowStyle = shadowStyle
        copy.baselineOffset = baselineOffset
        copy.obliqueness = obliqueness
        copy.expansion = expansion
        copy.strikeThroughLine = strikeThroughLine
        copy.underlineLine = underlineLine
        copy.strokeColor = strokeColor
        copy.effectStyle = effectStyle
        copy.attachment = attachment
        copy.alignment = alignment
        copy.lineBreakMode = lineBreakMode
        copy.lineSpacing = lineSpacing
        copy.paragraphSpacing = paragraphSpacing
        copy.paragraphSpacingBefore = paragraphSpacingBefore
        copy.lineHeight = lineHeight
        copy.paragraphStyle = paragraphStyle
        copy.link = link
        return copy
    }
}

// MARK: - Equatable

extension TextStyle: Equatable {

    public static func == (lhs: TextStyle, rhs: TextStyle) -> Bool {
        return lhs.font == rhs.font &&
            lhs.color == rhs.color &&
            lhs.backgroundColor == rhs.backgroundColor &&
            lhs.ligature == rhs.ligature &&
            lhs.kerning == rhs.kerning &&
            lhs.strokeWidth == rhs.strokeWidth &&
            lhs.shadowStyle == rhs.shadowStyle &&
            lhs.baselineOffset == rhs.baselineOffset &&
            lhs.obliqueness == rhs.obliqueness &&
            lhs.expansion == rhs.expansion &&
            lhs.strikeThroughLine == rhs.strikeThroughLine &&
            lhs.underlineLine == rhs.underlineLine &&
            lhs.strokeColor == rhs.strokeColor &&
            lhs.effectStyle == rhs.effectStyle &&
            lhs.attachment == rhs.attachment &&
            lhs.alignment == rhs.alignment &&
            lhs.lineBreakMode == rhs.lineBreakMode &&
            lhs.lineSpacing == rhs.lineSpacing &&
            lhs.paragraphSpacing == rhs.paragraphSpacing &&
            lhs.paragraphSpacingBefore == rhs.paragraphSpacingBefore &&
            lhs.lineHeight == rhs.lineHeight &&
            lhs.paragraphStyle == rhs.paragraphStyle &&
            lhs.link == rhs.link
    }
}
