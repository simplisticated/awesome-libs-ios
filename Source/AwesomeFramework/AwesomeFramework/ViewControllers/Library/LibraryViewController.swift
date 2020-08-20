import UIKit
import Visuality
import Pixels
import AwesomeData
import AwesomeStyles
import AwesomeViewControllers
import Hero

public class LibraryViewController: UIViewController {
    
    @IBOutlet private weak var libraryNameLabel: UILabel!
    
    @IBOutlet private weak var developerNameLabel: UILabel!
    
    @IBOutlet private weak var shortDescriptionLabel: UILabel!
    
    @IBOutlet private weak var cocoapodsInstructionViewContainer: ContainerView!
    
    private var cocoapodsInstructionView: PackageManagerShortInstructionView!
    
    @IBOutlet private weak var carthageInstructionViewContainer: ContainerView!
    
    private var carthageInstructionView: PackageManagerShortInstructionView!
    
    @IBOutlet private weak var spmInstructionViewContainer: ContainerView!
    
    private var spmInstructionView: PackageManagerShortInstructionView!
    
    @IBOutlet private weak var sourcesButton: UIButton!
    
    @IBOutlet private weak var demoTitleLabel: UILabel!
    
    @IBOutlet private weak var launchDemoButton: UIButton!
    
    private weak var navigationBarLaunchDemoButton: UIBarButtonItem!
    
    public var library: Library? {
        didSet {
            guard let library = self.library else { return }
            self.updateNavigationBar(with: library)
            self.updateLibraryNameLabel(with: library)
            self.updateDeveloperNameLabel(with: library)
            self.updateShortDescriptionLabel(with: library)
            self.updatePackageManagerInstructions(with: library)
            self.updateSourcesButton(with: library)
            self.updateDemoTitleLabel(with: library)
            self.updateLaunchDemoButton(with: library)
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupPackageManagerInstructions()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hero.isEnabled = true
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = ""
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func updateNavigationBar(with library: Library) {
        if self.isUserAllowedToOpenDemoScreen(library) {
            let launchDemoButton = UIBarButtonItem(title: "Run Demo", style: .done, target: self, action: #selector(launchDemoButtonDidTap))
            launchDemoButton.tintColor = StyleSheet.default.liveDemoColor
            self.navigationItem.rightBarButtonItems = [
                launchDemoButton
            ]
            self.navigationBarLaunchDemoButton = launchDemoButton
        }
    }
    
    private func setupPackageManagerInstructions() {
        self.cocoapodsInstructionViewContainer.setContentView(ofType: PackageManagerShortInstructionView.self, fromNib: .byClassName, locatedInBundle: .byInstance(bundle: .AwesomeFramework)) { (contentView) in
            contentView.packageManager = .cocoapods
            contentView.delegate = self
            self.cocoapodsInstructionView = contentView
        }
        
        self.carthageInstructionViewContainer.setContentView(ofType: PackageManagerShortInstructionView.self, fromNib: .byClassName, locatedInBundle: .byInstance(bundle: .AwesomeFramework)) { (contentView) in
            contentView.packageManager = .carthage
            contentView.delegate = self
            self.carthageInstructionView = contentView
        }
        
        self.spmInstructionViewContainer.setContentView(ofType: PackageManagerShortInstructionView.self, fromNib: .byClassName, locatedInBundle: .byInstance(bundle: .AwesomeFramework)) { (contentView) in
            contentView.packageManager = .swiftPackageManager
            contentView.delegate = self
            self.spmInstructionView = contentView
        }
    }
    
    private func updatePackageManagerInstructions(with library: Library) {
        if let cocoapods = library.integration.cocoapods {
            self.cocoapodsInstructionView.instruction = .text(value: cocoapods.instruction)
        } else {
            self.cocoapodsInstructionView.instruction = .notSupported
        }
        
        if let carthage = library.integration.carthage {
            self.carthageInstructionView.instruction = .text(value: carthage.instruction)
        } else {
            self.carthageInstructionView.instruction = .notSupported
        }
        
        if let spm = library.integration.swiftPackageManager {
            self.spmInstructionView.instruction = .text(value: spm.instruction)
        } else {
            self.spmInstructionView.instruction = .notSupported
        }
    }
    
    private func updateLibraryNameLabel(with library: Library) {
        let text = library.name
        self.libraryNameLabel.text = library.name
        
        let font: UIFont = text.count > 10
            ? .systemFont(ofSize: 27, weight: .bold)
            : .systemFont(ofSize: 38, weight: .bold)
        self.libraryNameLabel.font = font
    }
    
    private func updateDeveloperNameLabel(with library: Library) {
        let text = "by \(library.developers.first?.name ?? "")"
        self.developerNameLabel.text = text
    }
    
    private func updateShortDescriptionLabel(with library: Library) {
        self.shortDescriptionLabel.text = library.description.short
    }
    
    private func updateSourcesButton(with library: Library) {
        let title = library.links.github?.urlStringWithoutProtocol() ?? library.links.other.first ?? "Sources"
        self.sourcesButton.setTitle(title, for: .normal)
    }
    
    private func updateDemoTitleLabel(with library: Library) {
        let hasDemoScreen = self.isUserAllowedToOpenDemoScreen(library)
        self.demoTitleLabel.text = hasDemoScreen
            ? "Want to try right now?"
            : "Want to try demo?"
    }
    
    private func updateLaunchDemoButton(with library: Library) {
        let hasDemoScreen = self.isUserAllowedToOpenDemoScreen(library)
        
        let title = hasDemoScreen
            ? "Launch Live Demo"
            : "Available in upcoming update"
        self.launchDemoButton.setTitle(title, for: .normal)
        
        let backgroundColor = hasDemoScreen
            ? StyleSheet.default.liveDemoColor
            : UIColor.Material.BlueGray._700
        self.launchDemoButton.backgroundColor = backgroundColor
    }
    
    @IBAction private func sourcesButtonDidTap() {
        guard let library = self.library else { return }
        
        let controller = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        controller.view.tintColor = UIColor.Material.Black.default
        
        if let githubLink = library.links.github {
            controller.addAction(.init(
                title: "Open GitHub",
                style: .default,
                handler: { (action) in
                    self.openURL(githubLink.urlString())
                }
            ))
        }
        
        if let otherWebsite = library.links.other.first {
            controller.addAction(.init(
                title: "Open Website",
                style: .default,
                handler: { (action) in
                    self.openURL(otherWebsite)
                }
            ))
        }
        
        controller.addAction(.init(
            title: "Share Links",
            style: .default,
            handler: { (action) in
                var links = Array<String>()
                
                if let githubLink = library.links.github {
                    links.append(githubLink.urlString())
                }
                
                links.append(contentsOf: library.links.other)
                
                let urls = links.map { (link) -> URL in
                    return URL(string: link)!
                }
                
                let activityViewController = UIActivityViewController(
                    activityItems: urls,
                    applicationActivities: nil
                )
                self.present(activityViewController, animated: true) {
                }
            }
        ))
        
        controller.addAction(.init(
            title: "Cancel",
            style: .cancel,
            handler: { (action) in
            }
        ))
        
        self.present(controller, animated: true) {
        }
    }
    
    @objc
    @IBAction private func launchDemoButtonDidTap() {
        guard let library = self.library,
            let demoScreen = library.demoScreen,
            self.isUserAllowedToOpenDemoScreen(library) else {
            return
        }
        
        var demoViewController: UIViewController?
        let awesomeType = demoScreen.viewControllerClass.self as? AwesomeViewController.Type
        
        if let awesomeType = awesomeType {
            demoViewController = awesomeType.awesomelyNew()
        }
        
        if demoViewController == nil {
            let bundle = Bundle(identifier: demoScreen.bundleIdentifier) ?? .main
            let nibName = demoScreen.nibName ?? ""
            demoViewController = demoScreen.viewControllerClass.from(nib: .byNibName(name: nibName), inBundle: .byInstance(bundle: bundle))
        }
        
        if let demoViewController = demoViewController {
            demoViewController.navigationItem.largeTitleDisplayMode = .never
            demoViewController.hidesBottomBarWhenPushed = true
            
            self.navigationController?.hero.isEnabled = false
            self.navigationController?.pushViewController(demoViewController, animated: true)
        }
    }
    
    private func isUserAllowedToOpenDemoScreen(_ library: Library) -> Bool {
        return (library.demoScreen != nil) && (library.demoScreen?.enabled ?? false)
    }
    
    private func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:]) { (finished) in
            }
        }
    }
}

extension LibraryViewController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        return self.from(nib: .byClassName, inBundle: .byInstance(bundle: .AwesomeFramework), loadView: true)
    }
}

extension LibraryViewController: PackageManagerShortInstructionViewDelegate {
    
    public func packageManagerShortInstructionViewDidTap(_ view: PackageManagerShortInstructionView) {
        switch view {
        case self.cocoapodsInstructionView:
            print("CocoaPods did tap")
            break
        case self.carthageInstructionView:
            print("Carthage did tap")
            break
        case self.spmInstructionView:
            print("SPM did tap")
            break
        default:
            break
        }
    }
}
