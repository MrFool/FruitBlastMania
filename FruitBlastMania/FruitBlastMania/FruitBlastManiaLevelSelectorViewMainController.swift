/*
    This is the level selector screen controller, for users to select one of the five pre-packaged levels
*/

import UIKit

class FruitBlastManiaLevelSelectorViewMainController: UIViewController {
    
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
