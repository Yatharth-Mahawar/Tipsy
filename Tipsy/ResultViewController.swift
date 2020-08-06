import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var indiBillLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var totalBill = "0.0"
    var userSpilt = 0
    var tip = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indiBillLabel.text = totalBill
        infoLabel.text = "Split between \(userSpilt) people, with \(tip)% tip."
        
    }
    

    @IBAction func recalculateButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
