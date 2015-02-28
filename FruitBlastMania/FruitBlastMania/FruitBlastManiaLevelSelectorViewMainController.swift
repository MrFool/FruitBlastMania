/*
    This is the level selector screen controller, for users to select one of the five pre-packaged levels
*/

import UIKit

class FruitBlastManiaLevelSelectorViewMainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // I think this is where we pass in the objects when we do the storyboard segues
        // Get the new view controller using [segue destinationViewController].
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
