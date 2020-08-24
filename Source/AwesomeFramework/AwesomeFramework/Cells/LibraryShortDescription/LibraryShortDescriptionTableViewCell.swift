import UIKit
import AwesomeData

class LibraryShortDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var libraryShortDescription: String? {
        didSet {
            let descriptionText = self.libraryShortDescription ?? ""
            self.descriptionLabel.text = descriptionText
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
