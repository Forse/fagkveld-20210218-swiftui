import Foundation
import UIKit

class HorseStoryboardView: UIView {
    @IBOutlet var imageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.backgroundColor = UIColor.gray.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 10

        if let imageView = imageView {
            imageView.layer.backgroundColor = UIColor.green.cgColor
            imageView.layer.cornerRadius = (imageView.bounds.width / 2)
        }
    }
}
