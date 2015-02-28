/*
    This is the main game view controller that will contain the game area grid and also
    the area for bubble shooting / new bubbles etc.
*/

import UIKit

class FruitBlastManiaGameViewMainController: UIViewController {
    var currentLevelName: String?
    var currentLevel: BasicLevel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
