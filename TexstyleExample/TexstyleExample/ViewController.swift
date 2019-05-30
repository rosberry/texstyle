//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit
import Texstyle

final class ViewController: UIViewController {

    // MARK: - Subviews

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private lazy var paragraphLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private lazy var exampleButton: UIButton = {
        let button = UIButton(type: .system)
        var highlightedTextStyle = TextStyle.heading1
        highlightedTextStyle.color = .red
        let text = Text(value: "Push me", styles: [.normal: .heading1,
                                                   .highlighted: highlightedTextStyle])
        button.setText(text)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(headingLabel)
        view.addSubview(paragraphLabel)
        view.addSubview(exampleButton)

        updateLabels()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let inset: CGFloat = 16
        let size = CGSize(width: view.bounds.width - 2 * inset, height: 32)

        titleLabel.frame = CGRect(x: inset, y: view.safeAreaInsets.top, width: size.width, height: size.height)
        headingLabel.frame = CGRect(x: inset, y: titleLabel.frame.maxY, width: size.width, height: size.height)
        paragraphLabel.frame = CGRect(x: inset, y: headingLabel.frame.maxY, width: size.width, height: size.height)
        exampleButton.frame = CGRect(x: inset, y: paragraphLabel.frame.maxY, width: size.width, height: size.height)
    }

    // MARK: - Private

    private func updateLabels() {

        titleLabel.attributedText = Text(value: "Title", style: .title1).attributed
        headingLabel.attributedText = Text(value: "Heading", style: .heading1).attributed

        let urlString = "https://github.com/rosberry/texstyle"
        let serverURL = "URL: " + urlString
        let text = Text(value: serverURL, style: .paragraph1)
        text.add(.paragraph2, for: urlString)
        paragraphLabel.attributedText = text.attributed
    }
}
