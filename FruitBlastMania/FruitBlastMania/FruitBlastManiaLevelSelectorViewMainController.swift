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
        if segue.destinationViewController.title == "Fruit Blast Mania Game View Main Controller" {
            let levelSelectedButton = sender as UIButton
            
            switch levelSelectedButton.titleLabel.text! {
            case "Level One":
                // in some way, initiate level one into the game controller
                break;
            case "Level Two":
                // in some way, initiate level two into the game controller
                break;
            case "Level Three":
                // in some way, initiate level three into the game controller
                break;
            case "Level Four":
                // in some way, initiate level four into the game controller
                break;
            case "Level Five":
                // in some way, initiate level five into the game controller
                break;
            default:
                break;
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
