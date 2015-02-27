/*
    This is the level designer main view controller, the one to segue to that will have container views
    to contain the palette view and also the grid
*/

import UIKit

class FruitBlastManiaLevelDesignerViewMainController: UIViewController {
    
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
