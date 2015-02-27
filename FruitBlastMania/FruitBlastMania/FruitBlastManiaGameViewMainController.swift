/*
    This is the main game view controller that will contain the game area grid and also
    the area for bubble shooting / new bubbles etc.
*/

import UIKit

class FruitBlastManiaGameViewMainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // do we really need this?
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
