import UIKit

public class LibraryDemoViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var icons = allIcons()
    
    deinit {
        self.tableView?.dataSource = nil
        self.tableView?.delegate = nil
        self.icons = []
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "fluentui-system-icons demo"
        self.setupTableView()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.icons = []
        self.tableView.reloadData()
    }
    
    private func setupTableView() {
        let cellNib = UINib(nibName: "IconTableViewCell", bundle: .fluentui_system_icons())
        self.tableView.register(cellNib, forCellReuseIdentifier: "IconTableViewCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension LibraryDemoViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.icons.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icon = self.icons[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconTableViewCell") as! IconTableViewCell
        cell.icon = icon
        return cell
    }
}

extension LibraryDemoViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
