import UIKit
import AwesomeData
import AwesomeStyles

class LaunchDemoScreenTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBOutlet private weak var launchLabel: UILabel!
    
    var demoScreen: DemoScreen?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.iconImageView.tintColor = StyleSheet.default.liveDemoColor
    }
}
