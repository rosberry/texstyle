//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit
import Texstyle

final class ViewController: UIViewController {

    private var texts: [Text] = [] {
        didSet {
            for text in texts {
                let label = UILabel()
                label.numberOfLines = 0
                label.attributedText = text.attributed
                labels.append(label)
            }
        }
    }

    // MARK: - Subviews

    var labels: [UILabel] = []

    private lazy var exampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 32, bottom: 8, right: 32)
        button.backgroundColor = .black

        var heading2 = TextStyle.heading1.copy()
        heading2.color = .white
        let text = Text(value: " Sign in with Apple", styles: [.normal: heading2,
                                                                  .highlighted: .heading1])
        button.setText(text)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabels()

        view.backgroundColor = .white
        labels.forEach(view.addSubview)
        view.addSubview(exampleButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let inset: CGFloat = 16
        let constrainedSize = CGSize(width: view.bounds.width - inset * 2, height: .greatestFiniteMagnitude)

        var yPosition = view.safeAreaInsets.top
        for label in labels {
            label.frame.origin = CGPoint(x: inset, y: yPosition)
            label.frame.size = label.sizeThatFits(constrainedSize)
            yPosition += label.frame.size.height + 16
        }

        exampleButton.frame.origin = CGPoint(x: inset, y: yPosition)
        exampleButton.sizeToFit()
        exampleButton.layer.cornerRadius = exampleButton.bounds.height / 2
    }

    // MARK: - Private

    private func updateLabels() {
        let headingText = Text(value: "Using Texstyle", style: .title1)

        let titleText = Text(value: "Add substyle", style: .title1)
        titleText.add(.heading1, for: "substyle")

        let urlString = "https://github.com/rosberry/texstyle"
        let serverURL = "URL: " + urlString
        let linkText = Text(value: serverURL, style: .paragraph1)
        linkText.add(.paragraph2, for: urlString)

        let richText = Text(value: "Rich string formatting", style: .title1)
        richText.add(.substyle1, for: "Rich")
        richText.add(.substyle2, for: "string")
        richText.add(.substyle3, for: "formatting")

        texts = [headingText, titleText, linkText, richText]
    }
}
