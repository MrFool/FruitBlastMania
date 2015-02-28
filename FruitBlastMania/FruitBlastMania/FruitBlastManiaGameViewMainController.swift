/*
    This is the main game view controller that will contain the game area grid and also
    the area for bubble shooting / new bubbles etc.
*/

import UIKit

class FruitBlastManiaGameViewMainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this is where we attach the NSTimer to simulate the framing per second
        
        // this is where we attach the gesture for pew pew
        
        // this is where we attach the sound thing? I think...
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
