import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var zeroSelected: UIButton!
    @IBOutlet weak var tenSelected: UIButton!
    @IBOutlet weak var twentySelected: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!

    var userBill = 0.0
    var userTip = 0.10
    var userSplit = 2
    var calculatedResult = "0.0"
    
    
    @IBAction func tipSelected(_ sender: UIButton) {
        
        userTextField.endEditing(true)
        zeroSelected.isSelected = false
        tenSelected.isSelected = false
        twentySelected.isSelected = false
        sender.isSelected = true
        
        let buttonTile = sender.currentTitle!
        let buttonTileNumber = String(buttonTile.dropLast())
        let buttonNumber = Double(buttonTileNumber)!
        userTip = buttonNumber / 100
        
        
    }
    
    @IBAction func stepperSelected(_ sender: UIStepper) {
        userTextField.endEditing(true)
        splitLabel.text = String(Int(sender.value))
        userSplit = Int(sender.value)
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let userTextValue = userTextField.text!
        let userValue = Double(String(userTextValue))!
        userBill = userValue
        let totalBill = (userBill*userTip)+userBill
        let individualBill = totalBill / Double(userSplit)
        calculatedResult = String(format: "%.2f", individualBill)
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalBill = calculatedResult
            destinationVC.userSpilt = userSplit
            destinationVC.tip = Int(userTip*100)
        }
    }
}

