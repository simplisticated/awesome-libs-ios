import UIKit
import FluentIcons

class IconTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBOutlet private weak var iconNameLabel: UILabel!
    
    var icon: Icon? {
        didSet {
            guard let icon = self.icon else { return }
            self.iconImageView.image = UIImage(fluent: icon.imageIdentifier)
            self.iconNameLabel.text = icon.name
        }
    }
}
