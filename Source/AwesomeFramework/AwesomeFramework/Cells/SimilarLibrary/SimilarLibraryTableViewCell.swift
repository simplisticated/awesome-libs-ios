import UIKit
import AwesomeData

class SimilarLibraryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    
    @IBOutlet private weak var libraryNameLabel: UILabel!
    
    var library: Library? {
        didSet {
            guard let library = self.library else { return }
            self.updateLogoImageView(withLibrary: library)
            self.updateLibraryNameLabel(withLibrary: library)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateLogoImageView(withLibrary library: Library) {
        if Configuration.usePreviewImageFromLibraryStore,
            let imageName = library.preview.logo?.name,
            let imageBundleIdentifier = library.preview.logo?.bundleIdentifier {
            self.logoImageView.image = UIImage(
                named: imageName,
                in: Bundle(identifier: imageBundleIdentifier),
                compatibleWith: nil
            )
        } else {
            self.logoImageView.image = UIImage(
                named: "no-library",
                in: .AwesomeFramework,
                compatibleWith: nil
            )
        }
    }
    
    private func updateLibraryNameLabel(withLibrary library: Library) {
        self.libraryNameLabel.text = library.preview.title
    }
}

fileprivate struct Configuration {
    static let usePreviewImageFromLibraryStore = false
}
