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
        if segue.destinationViewController.title == FruitBlastManiaConstants.gameMainViewControllerTitle {
            let levelSelectedButton = sender as UIButton
            
            let thatViewController = segue.destinationViewController as FruitBlastManiaGameViewMainController
            
            switch levelSelectedButton.titleLabel!.text! {
            case FruitBlastManiaConstants.levelOne:
                thatViewController.currentLevelName = FruitBlastManiaConstants.levelOne
            case FruitBlastManiaConstants.levelTwo:
                thatViewController.currentLevelName = FruitBlastManiaConstants.levelTwo
            case FruitBlastManiaConstants.levelThree:
                thatViewController.currentLevelName = FruitBlastManiaConstants.levelThree
            case FruitBlastManiaConstants.levelFour:
                thatViewController.currentLevelName = FruitBlastManiaConstants.levelFour
            case FruitBlastManiaConstants.levelFive:
                thatViewController.currentLevelName = FruitBlastManiaConstants.levelFive
            default:
                break
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
