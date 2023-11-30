
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var numPeople: UILabel!
    
    @IBOutlet weak var fifteenPctButton: UIButton!
    @IBOutlet weak var eighteenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tip: Float?
    var totalMoney = 0.0


    
    @IBAction func tipChanged(_ sender: UIButton) {
        //deselect all tip amounts
        fifteenPctButton.isSelected = false
        eighteenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //deselect the keyboard
        billTextField.endEditing(true)
        
        //highlight the selected tip button
        sender.isSelected = true
        
        //update tip to hold the selected value
        tip = Float("0." + sender.currentTitle!.dropLast(1))
    }//end tipChanged()
    
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numPeople.text = String(Int(sender.value))
        print(Int(sender.value))
    }//end stepperValueChanged()
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //grab the input value
        if tip == nil{
            tip = 0.0
        }
        
        let denom = Int(numPeople.text ?? "1")!
        let original = Float(billTextField.text ?? "0.0") ?? 0.0
        
        //calculate new total
        let newTotal = ((original * (tip ?? 0.0)) + (original)) / Float(denom)

        //update and format global variable
        totalMoney = Double(newTotal)
        totalMoney = round(100 * totalMoney) / 100
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }//end calculatePressed()
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            //pass values to the destination ViewController
            destinationVC.totalStr = String(totalMoney)
            destinationVC.numPeople = String(Int(numPeople.text ?? "1")!)
            destinationVC.tipPercent = String(Int(tip! * 100)) //reformat to integer
        }
    }//end prepare()
    
}

