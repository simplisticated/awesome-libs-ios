import UIKit
import AwesomeData

class LibraryNameTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var library: Library? {
        didSet {
            guard let library = self.library else { return }
            self.nameLabel.text = library.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
