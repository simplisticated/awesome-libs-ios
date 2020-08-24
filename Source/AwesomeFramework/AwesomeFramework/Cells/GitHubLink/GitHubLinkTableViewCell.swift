import UIKit
import AwesomeData

class GitHubLinkTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var linkLabel: UILabel!
    
    var githubLink: GitHubRepositoryLink? {
        didSet {
            guard let githubLink = self.githubLink else { return }
            self.linkLabel.text = URL(string: githubLink.urlString())?.host
        }
    }
}
