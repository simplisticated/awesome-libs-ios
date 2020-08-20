import UIKit
//import FlagKit

public typealias LibraryDemoViewController = FlagsListViewController

public class FlagsListViewController: UITableViewController {
    var style: FlagStyle = .none {
        didSet {
            tableView.reloadData()
        }
    }
    
    let stylePicker: UISegmentedControl = {
        let items = FlagStyle.all.map({ $0.name })
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    let flags = Flag.all
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = stylePicker
        
        tableView.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.97, alpha: 1.0)
        tableView.separatorColor = UIColor.black.withAlphaComponent(0.1)
        tableView.register(FlagTableViewCell.self, forCellReuseIdentifier: FlagTableViewCell.identifier)
        
        stylePicker.addTarget(self, action: #selector(styleDidChange), for: .valueChanged)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: UITableViewDataSource
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlagTableViewCell.identifier, for: indexPath)
        
        let flag = flags[indexPath.row]
        cell.textLabel?.text = flag.localizedName
        cell.detailTextLabel?.text = flag.countryCode
        cell.imageView?.image = flag.image(style: style)
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: Private
    @objc private func styleDidChange() {
        style = FlagStyle(rawValue: stylePicker.selectedSegmentIndex)!
    }
}
