import Foundation
import UIKit

class HorseView: UIView {

    // MARK: - UI properties

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hest")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.backgroundColor = UIColor.green.cgColor
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dette er en hest."

        let font = UIFont.preferredFont(forTextStyle: .body)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            label.font = UIFont(descriptor: descriptor, size: 0)
        } else {
            label.font = UIFont.boldSystemFont(ofSize: 17)
        }

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Det er mange som den, men denne er min. Uten hesten min er jeg ingenting."
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()

    // MARK: - Init

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    init() {
        super.init(frame: .zero)
        setup()
    }

    private func setup() {
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)

        layer.masksToBounds = true
        layer.backgroundColor = UIColor.gray.cgColor
        layer.cornerRadius = 10

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = (imageView.bounds.width / 2)
    }
}
