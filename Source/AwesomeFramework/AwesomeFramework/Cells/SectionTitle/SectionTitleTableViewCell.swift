import UIKit

class SectionTitleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var sectionTitle: String? {
        didSet {
            let title = self.sectionTitle ?? ""
            self.titleLabel.text = title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
