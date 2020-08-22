import UIKit
import AwesomeData

public class LibraryTableViewCell: UITableViewCell, LibraryTableViewCellProtocol {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    
    @IBOutlet private weak var libraryNameLabel: UILabel!
    
    @IBOutlet private weak var developerNameLabel: UILabel!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var licenseBadgeView: BadgeView!
    
    @IBOutlet private weak var liveDemoBadgeView: BadgeView!
    
    public var library: Library? {
        didSet {
            guard let library = self.library else { return }
            self.updateLogoImageView(withLibrary: library)
            self.updateLibraryNameLabel(withLibrary: library)
            self.updateDeveloperNameLabel(withLibrary: library)
            self.updateDescriptionLabel(withLibrary: library)
            self.updateLicenseBadgeView(withLibrary: library)
            self.updateLiveDemoBadgeView(withLibrary: library)
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLogoImageView()
        self.setupLibraryNameLabel()
        self.setupDeveloperNameLabel()
        self.setupDescriptionLabel()
    }
    
    private func setupLogoImageView() {
    }
    
    private func updateLogoImageView(withLibrary library: Library?) {
        if let imageName = library?.preview.logo?.name,
            let imageBundleIdentifier = library?.preview.logo?.bundleIdentifier {
            self.logoImageView.image = UIImage(
                named: imageName,
                in: Bundle(identifier: imageBundleIdentifier),
                compatibleWith: nil
            )
            self.logoImageView.alpha = 1
        } else {
            self.logoImageView.image = UIImage(
                named: "no-library",
                in: .AwesomeFramework,
                compatibleWith: nil
            )
            self.logoImageView.alpha = 0.1
        }
    }
    
    private func setupLibraryNameLabel() {
    }
    
    private func updateLibraryNameLabel(withLibrary library: Library?) {
        self.libraryNameLabel.text = library?.preview.title
    }
    
    private func setupDeveloperNameLabel() {
    }
    
    private func updateDeveloperNameLabel(withLibrary library: Library?) {
        self.developerNameLabel.text = library?.developers.first?.name
    }
    
    private func setupDescriptionLabel() {
    }
    
    private func updateDescriptionLabel(withLibrary library: Library?) {
        self.descriptionLabel.text = library?.preview.subtitle
    }
    
    private func updateLicenseBadgeView(withLibrary library: Library?) {
        let licenseName = library?.license.name
        self.licenseBadgeView.text = licenseName
    }
    
    private func updateLiveDemoBadgeView(withLibrary library: Library?) {
        let hasLiveDemo = library?.demo.screen?.enabled ?? false
        self.liveDemoBadgeView.isHidden = !hasLiveDemo
    }
}
