import UIKit

class ViewController: UIViewController {
    @IBOutlet var horseStoryboardView: UIView?
    @IBOutlet var programmaticLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let label = programmaticLabel else {
            fatalError("Missing IBOutlet")
        }

        let horseView = HorseView()
        horseView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horseView)
        NSLayoutConstraint.activate([
            horseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horseView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            horseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}

