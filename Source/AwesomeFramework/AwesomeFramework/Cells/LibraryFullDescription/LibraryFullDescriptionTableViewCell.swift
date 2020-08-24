import UIKit
import AwesomeData

class LibraryFullDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var libraryFullDescription: String? {
        didSet {
            let descriptionText = self.libraryFullDescription ?? ""
            self.descriptionLabel.text = descriptionText
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
