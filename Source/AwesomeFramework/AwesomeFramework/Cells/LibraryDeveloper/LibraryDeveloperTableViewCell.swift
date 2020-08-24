import UIKit
import AwesomeData

class LibraryDeveloperTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var developer: Developer? {
        didSet {
            guard let developer = self.developer else { return }
            self.nameLabel.text = "by \(developer.name)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
