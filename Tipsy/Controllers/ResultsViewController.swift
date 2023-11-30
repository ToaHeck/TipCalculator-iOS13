
import UIKit

class ResultsViewController: UIViewController {

    var totalStr: String?
    var settingsStr: String?
    var numPeople: String?
    var tipPercent: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //update viewcontroller
        totalLabel.text = totalStr!
        settingsLabel.text = "Split between \(numPeople!) people, with \(tipPercent!)% tip"
    }//end viewDidLoad()
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //return to CalculatorViewController
        dismiss(animated: true, completion: nil)
    }//end recalculatePressed()

}
