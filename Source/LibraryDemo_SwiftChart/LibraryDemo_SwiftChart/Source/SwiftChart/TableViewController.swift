import UIKit
import AwesomeViewControllers

public class TableViewController: UITableViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath as NSIndexPath).row == 4 {
            performSegue(withIdentifier: "StockChartSegue", sender: nil)
        }
        else {
            performSegue(withIdentifier: "BasicChartSegue", sender: nil)
        }
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BasicChartSegue" {
            let indexPath = tableView.indexPathForSelectedRow
            let dvc = segue.destination as! BasicChartViewController
            dvc.selectedChart = (indexPath! as NSIndexPath).row
        }
    }
    
}

extension TableViewController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: .current())
        let viewController = storyboard.instantiateViewController(withIdentifier: "table-view-controller")
        return viewController as! Self
    }
}
