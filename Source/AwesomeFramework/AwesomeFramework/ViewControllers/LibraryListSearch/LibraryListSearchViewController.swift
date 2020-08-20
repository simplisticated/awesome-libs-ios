import UIKit
import AwesomeData
import AwesomeViewControllers

public class LibraryListSearchViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var tableViewBottom: NSLayoutConstraint!
    
    public var searchResult = Array<Library>() {
        didSet {
            self.tableView.reloadData()
            self.tableView.isHidden = self.searchResult.count == 0
        }
    }
    
    public weak var delegate: LibraryListSearchViewControllerDelegate?

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.subscribeToKeyboardNotifications()
    }
    
    private func setupTableView() {
        self.tableView.separatorInset = .zero
        tableView.keyboardDismissMode = .interactive
        
        self.tableView.register(
            UINib(nibName: LibraryTableViewCell.hmr.shortName, bundle: .AwesomeFramework),
            forCellReuseIdentifier: LibraryTableViewCell.hmr.fullName
        )
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @objc
    private func keyboardWillChangeFrame(withNotication notification: Notification) {
        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.tableViewBottom.constant = endFrame.size.height
    }
    
    private func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(withNotication:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
}

extension LibraryListSearchViewController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        return self.from(nib: .byClassName, inBundle: .byInstance(bundle: .AwesomeFramework), loadView: true)
    }
}

extension LibraryListSearchViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResult.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let library = self.searchResult[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LibraryTableViewCell.hmr.fullName) as! LibraryTableViewCell
        cell.library = library
        return cell
    }
}

extension LibraryListSearchViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let library = self.searchResult[indexPath.row]
        self.delegate?.libraryListSearchViewController(self, didSelectLibrary: library)
    }
}
