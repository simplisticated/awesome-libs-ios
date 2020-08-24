import UIKit

class LinkTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBOutlet private weak var linkLabel: UILabel!
    
    var link: String? {
        didSet {
            guard let link = self.link else { return }
            let host = URL(string: link)?.host ?? ""
            self.linkLabel.text = host
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
