import UIKit
import Visuality
import Pixels
import Hammer
import AwesomeData
import AwesomeStyles
import AwesomeViewControllers
import Hero

public class LibraryViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    public var library: Library? {
        didSet {
            guard let library = self.library else { return }
            
            self.updateNavigationBar(with: library)
            
            self.tableView.beginUpdates()
            self.items = self.items(for: library)
            self.tableView.reloadData()
            self.tableView.endUpdates()
        }
    }
    
    private var items = Array<Item>()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupTableView()
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
            let launchDemoButton = UIBarButtonItem(title: "Run Demo", style: .done, target: self, action: #selector(launchDemoScreenButtonDidTap))
            launchDemoButton.tintColor = StyleSheet.default.liveDemoColor
            self.navigationItem.rightBarButtonItems = [
                launchDemoButton
            ]
        }
    }
    
    private func setupTableView() {
        self.tableView.separatorStyle = .none
        self.tableView.bounces = true
        //self.tableView.delaysContentTouches = false
        self.tableView.showsVerticalScrollIndicator = false
        
        let cellTypes: [UITableViewCell.Type] = [
            SectionTitleTableViewCell.self,
            SpaceTableViewCell.self,
            LibraryNameTableViewCell.self,
            LibraryDeveloperTableViewCell.self,
            LibraryShortDescriptionTableViewCell.self,
            LibraryFullDescriptionTableViewCell.self,
            PackageManagerIntegrationTableViewCell.self,
            GitHubLinkTableViewCell.self,
            LinkTableViewCell.self,
            LaunchDemoScreenTableViewCell.self,
            LaunchAppetizeDemoTableViewCell.self
        ]
        
        let registerCellWithNib = { (type: UITableViewCell.Type) in
            self.tableView.register(
                UINib(
                    nibName: type.hmr.shortName,
                    bundle: .AwesomeFramework
                ),
                forCellReuseIdentifier: type.hmr.fullName
            )
        }
        
        for type in cellTypes {
            registerCellWithNib(type)
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @objc
    private func launchDemoScreenButtonDidTap() {
        guard let library = self.library else { return }
        self.launchDemoScreen(for: library)
    }
    
    private func items(for library: Library) -> [Item] {
        var resultItems = Array<Item>([
            .sectionInterval,
            .libraryName(
                library: library
            ),
            .developer(
                profile: library.developers.first!
            ),
            .itemInterval,
            .libraryShortDescription(
                text: library.description.short
            ),
            .sectionInterval,
        ])
        
        if let fullDescription = library.description.full {
            resultItems.append(contentsOf: [
                .libraryFullDescription(
                    text: fullDescription
                ),
                .sectionInterval,
            ])
        }
        
        if library.supportsAtLeastOnePackageManager() {
            resultItems.append(contentsOf: [
                .sectionTitle(
                    title: "Dependency Managers"
                ),
                .itemInterval,
                .separator,
                .packageManagerIntegration(
                    packageManager: .cocoapods,
                    library: library
                ),
                .separator,
                .packageManagerIntegration(
                    packageManager: .carthage,
                    library: library
                ),
                .separator,
                .packageManagerIntegration(
                    packageManager: .swiftPackageManager,
                    library: library
                ),
                .separator,
                .sectionInterval,
            ])
        }
        
        if library.hasLinks() {
            resultItems.append(contentsOf: [
                .sectionTitle(
                    title: "Sources"
                ),
                .itemInterval,
                .separator
            ])
            
            if let githubLink = library.links.github {
                resultItems.append(contentsOf: [
                    .githubLink(link: githubLink),
                    .separator
                ])
            }
            
            for link in library.links.other {
                resultItems.append(contentsOf: [
                    .repositoryLink(
                        url: link
                    ),
                    .separator
                ])
            }
            
            resultItems.append(
                .sectionInterval
            )
        }
        
        if library.hasDemo() {
            resultItems.append(contentsOf: [
                .sectionTitle(
                    title: "Want to try right now?"
                ),
                .itemInterval,
                .separator
            ])
            
            if let demoScreen = library.demo.screen,
                demoScreen.enabled {
                resultItems.append(contentsOf: [
                    .launchDemoScreen(library: library),
                    .separator
                ])
            }
            
            if let appetizeLink = library.demo.appetize {
                resultItems.append(contentsOf: [
                    .launchAppetizeDemo(link: appetizeLink),
                    .separator
                ])
            }
            
            resultItems.append(
                .space(color: .clear, height: 20)
            )
        }
        
        return resultItems
    }
    
    private func isUserAllowedToOpenDemoScreen(_ library: Library) -> Bool {
        return library.demo.screen?.enabled ?? false
    }
    
    private func launchDemoScreen(for library: Library) {
        guard let demoScreen = library.demo.screen,
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

extension LibraryViewController {
    
    public enum Item {
        case sectionTitle(title: String)
        case space(color: UIColor, height: CGFloat)
        case libraryName(library: Library)
        case developer(profile: Developer)
        case libraryShortDescription(text: String)
        case libraryFullDescription(text: String)
        case packageManagerIntegration(packageManager: PackageManager, library: Library)
        case githubLink(link: GitHubRepositoryLink)
        case repositoryLink(url: String)
        case launchDemoScreen(library: Library)
        case launchAppetizeDemo(link: AppetizeLink)
        
        static var sectionInterval: Item {
            return .space(color: .clear, height: 20)
        }
        
        static var itemInterval: Item {
            return .space(color: .clear, height: 10)
        }
        
        static var separator: Item {
            return .space(color: .lightGray, height: 0.5)
        }
    }
}

extension LibraryViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        
        switch item {
        case .sectionTitle(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionTitleTableViewCell.hmr.fullName) as! SectionTitleTableViewCell
            cell.sectionTitle = title
            return cell
        case .space(let color, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: SpaceTableViewCell.hmr.fullName) as! SpaceTableViewCell
            cell.backgroundColor = color
            return cell
        case .libraryName(let library):
            let cell = tableView.dequeueReusableCell(withIdentifier: LibraryNameTableViewCell.hmr.fullName) as! LibraryNameTableViewCell
            cell.library = library
            return cell
        case .developer(let profile):
            let cell = tableView.dequeueReusableCell(withIdentifier: LibraryDeveloperTableViewCell.hmr.fullName) as! LibraryDeveloperTableViewCell
            cell.developer = profile
            return cell
        case .libraryShortDescription(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: LibraryShortDescriptionTableViewCell.hmr.fullName) as! LibraryShortDescriptionTableViewCell
            cell.libraryShortDescription = text
            return cell
        case .libraryFullDescription(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: LibraryFullDescriptionTableViewCell.hmr.fullName) as! LibraryFullDescriptionTableViewCell
            cell.libraryFullDescription = text
            return cell
        case .packageManagerIntegration(let packageManager, let library):
            let cell = tableView.dequeueReusableCell(withIdentifier: PackageManagerIntegrationTableViewCell.hmr.fullName) as! PackageManagerIntegrationTableViewCell
            cell.data = (packageManager, library)
            return cell
        case .githubLink(let link):
            let cell = tableView.dequeueReusableCell(withIdentifier: GitHubLinkTableViewCell.hmr.fullName) as! GitHubLinkTableViewCell
            cell.githubLink = link
            return cell
        case .repositoryLink(let url):
            let cell = tableView.dequeueReusableCell(withIdentifier: LinkTableViewCell.hmr.fullName) as! LinkTableViewCell
            cell.link = url
            return cell
        case .launchDemoScreen(let library):
            let cell = tableView.dequeueReusableCell(withIdentifier: LaunchDemoScreenTableViewCell.hmr.fullName) as! LaunchDemoScreenTableViewCell
            cell.demoScreen = library.demo.screen
            return cell
        case .launchAppetizeDemo(let link):
            let cell = tableView.dequeueReusableCell(withIdentifier: LaunchAppetizeDemoTableViewCell.hmr.fullName) as! LaunchAppetizeDemoTableViewCell
            cell.appetizeLink = link
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.items[indexPath.row]
        
        switch item {
        case .space(_, let height):
            return height
        default:
            return UITableView.automaticDimension
        }
    }
}

extension LibraryViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let item = self.items[indexPath.row]
        
        switch item {
        case .githubLink(let link):
            self.openURL(link.urlString())
            break
        case .repositoryLink(let url):
            self.openURL(url)
            break
        case .launchDemoScreen(let library):
            self.launchDemoScreen(for: library)
            break
        default:
            break
        }
        
        AppConfiguration.libraryViewController.events.didSelectItem?(self, item)
    }
}
