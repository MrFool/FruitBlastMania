/*
    This is the bubble shooter area view controller that is conatined within the game main
    view controller
*/

import UIKit

class FruitBlastManiaBubbleShooterViewController: UIViewController {
    @IBOutlet weak var currentBubbleToBeShot: UIImageView!
    @IBOutlet weak var nextBubbleToBeShot: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
