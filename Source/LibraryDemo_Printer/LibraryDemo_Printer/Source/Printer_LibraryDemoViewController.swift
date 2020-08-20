import UIKit
import AwesomeStyles

public class Printer_LibraryDemoViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Printer Demo"
        
        Printer.log.addLineAfterEachPrint = true
            Printer.log.capitalizeTitles = true
            Printer.log.addAppEventsHandler()
            Printer.log.onLogCompletion = { (printLog, fileName, functionName, lineNumber) in
                print(printLog, fileName, functionName, lineNumber)
            }
            Printer.log.skipFile()
            Printer.log.trace()
            Printer.log.addFile()
            Printer.log.keepTracking = true
            Printer.log.show(id: "001", details: "This is a Success message.", logType: .success)
            Printer.log.show(id: "002", details: "This is a Error message.", logType: .error)
            Printer.log.show(id: "003", details: "This is an Information message.", logType: .information)
            Printer.log.show(id: "004", details: "This is a Warning message.", logType: .warning)
            Printer.log.show(id: "005", details: "This is an Alert message.", logType: .alert)
            Printer.log.show(details: "This is another Success message without ID", logType: .success)
            Printer.log.success(id: "001", details: "This is another Success message.")
            Printer.log.success(details: "This is a Success message.")
            let array = Printer.log.getAllLogs(filterLogTypes: [.success])
            Printer.log.saveLogsToFile(logs: array)
    }
    
    @IBAction func logButtonDidTap(_ sender: Any) {
        let printerStoryboard = UIStoryboard.init(name: "Printer", bundle: Bundle.Printer())
        let navcontroller = UINavigationController.init(rootViewController: (printerStoryboard.instantiateViewController(withIdentifier: "PrinterViewControllerID")))
        navcontroller.navigationBar.barTintColor = StyleSheet.default.navigationBarBackgroundColor
        navcontroller.navigationBar.tintColor = StyleSheet.default.navigationBarButtonColor
        navcontroller.navigationBar.prefersLargeTitles = false
        self.present(navcontroller, animated: true, completion: nil)
    }
}
