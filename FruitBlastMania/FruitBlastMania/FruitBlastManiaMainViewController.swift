/*
    This is the menu screen controller, the first screen that a user sees after the loading screen
*/

import UIKit

class FruitBlastManiaMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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