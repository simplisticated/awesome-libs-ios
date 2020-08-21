import UIKit
import Visuality
import Hammer
import AwesomeData
import AwesomeViewControllers

public class LibraryListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var searchResultsController: LibraryListSearchViewController!
    
    private let libraries = LibraryStore.shared.allLibraries()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupSearch()
        self.setupTableView()
        AppConfiguration.libraryListViewController.events.viewDidLoad?(self)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = false
        AppConfiguration.libraryListViewController.events.viewWillAppear?(self)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppConfiguration.libraryListViewController.events.viewDidAppear?(self)
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Libraries"
        self.navigationItem.largeTitleDisplayMode = .always
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonDidTap))
        self.navigationItem.rightBarButtonItems = [
            searchButton
        ]
    }
    
    private func setupSearch() {
        let searchResultsController = LibraryListSearchViewController.awesomelyNew()
        searchResultsController.delegate = self
        self.searchResultsController = searchResultsController
        
        let searchController = UISearchController(
            searchResultsController: searchResultsController
        )
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func setupTableView() {
        self.tableView.separatorInset = .zero
        
        self.tableView.register(
            UINib(
                nibName: AppConfiguration.libraryTableViewCell.nibName,
                bundle: Bundle(identifier: AppConfiguration.libraryTableViewCell.bundleIdentifier)
            ),
            forCellReuseIdentifier: ReuseIdentifiers.libraryCell
        )
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @objc
    private func searchButtonDidTap() {
        self.navigationItem.searchController?.isActive = true
        self.navigationItem.searchController?.searchBar.becomeFirstResponder()
    }
    
    private func openLibraryScreen(for library: Library) {
        let libraryViewController = LibraryViewController.awesomelyNew()
        libraryViewController.library = library
        libraryViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(libraryViewController, animated: true)
    }
}

extension LibraryListViewController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        return self.from(nib: .byClassName, inBundle: .byInstance(bundle: .AwesomeFramework))
    }
}

extension LibraryListViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.libraries.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let library = self.libraries[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.libraryCell) as! AnyLibraryTableViewCell
        cell.library = library
        return cell
    }
}

extension LibraryListViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let library = self.libraries[indexPath.row]
        self.openLibraryScreen(for: library)
    }
}

extension LibraryListViewController: LibraryListSearchViewControllerDelegate {
    
    public func libraryListSearchViewController(_ controller: LibraryListSearchViewController, didSelectLibrary library: Library) {
        self.openLibraryScreen(for: library)
    }
}

extension LibraryListViewController: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchResult = LibraryStore.shared.libraries(forSearchQuery: searchText)
        self.searchResultsController.searchResult = searchResult
    }
}

fileprivate struct ReuseIdentifiers {
    static let libraryCell = "library"
}
