/*
    This is the bubble shooter area view controller that is conatined within the game main
    view controller
*/

import UIKit

class FruitBlastManiaBubbleShooterViewController: UIViewController {
    @IBOutlet weak var currentBubbleToBeShot: UIImageView!
    @IBOutlet weak var nextBubbleToBeShot: UIImageView!
    @IBOutlet weak var theCannon: UIImageView!
    
    var arrayOfCannonImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cannonSpriteSheet = UIImage(named: "cannon")!.CGImage
        
        let cropRect0 = CGRect(x: 20 + 360 * 0, y: 100, width: 360, height: 700)
        let cropRect1 = CGRect(x: 60 + 360 * 1, y: 100, width: 360, height: 700)
        let cropRect2 = CGRect(x: 100 + 360 * 2, y: 100, width: 360, height: 700)
        let cropRect3 = CGRect(x: 140 + 360 * 3, y: 100, width: 360, height: 700)
        let cropRect4 = CGRect(x: 180 + 360 * 4, y: 100, width: 360, height: 700)
        let cropRect5 = CGRect(x: 220 + 360 * 5, y: 100, width: 360, height: 700)
        
        let cropRect6 = CGRect(x: 20 + 360 * 0, y: 900, width: 360, height: 700)
        let cropRect7 = CGRect(x: 60 + 360 * 1, y: 900, width: 360, height: 700)
        let cropRect8 = CGRect(x: 100 + 360 * 2, y: 900, width: 360, height: 700)
        let cropRect9 = CGRect(x: 140 + 360 * 3, y: 900, width: 360, height: 700)
        let cropRect10 = CGRect(x: 180 + 360 * 4, y: 900, width: 360, height: 700)
        let cropRect11 = CGRect(x: 220 + 360 * 5, y: 900, width: 360, height: 700)
        
        var imageRef0 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect0)
        var imageRef1 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect1)
        var imageRef2 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect2)
        var imageRef3 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect3)
        var imageRef4 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect4)
        var imageRef5 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect5)
        var imageRef6 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect6)
        var imageRef7 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect7)
        var imageRef8 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect8)
        var imageRef9 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect9)
        var imageRef10 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect10)
        var imageRef11 = CGImageCreateWithImageInRect(cannonSpriteSheet, cropRect11)
        
        theCannon.image = UIImage(CGImage: imageRef0)
        
        arrayOfCannonImages.append(UIImage(CGImage: imageRef0)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef1)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef2)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef3)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef4)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef5)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef6)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef7)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef8)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef9)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef10)!)
        arrayOfCannonImages.append(UIImage(CGImage: imageRef11)!)
        
        self.view.sendSubviewToBack(theCannon)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func quitPressed(sender: UIButton) {
        let parentViewController = self.parentViewController! as FruitBlastManiaGameViewMainController
        
        let gridViewController = parentViewController.childViewControllers[0] as FruitBlastManiaGameGridViewController
        
        gridViewController.quitIsPressed = true
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func swapPressed(sender: UIButton) {
        let parentViewController = self.parentViewController! as FruitBlastManiaGameViewMainController
        
        let gridViewController = parentViewController.childViewControllers[0] as FruitBlastManiaGameGridViewController
        
        let rightImage = currentBubbleToBeShot.image
        let leftImage = nextBubbleToBeShot.image
        
        currentBubbleToBeShot.image = leftImage
        nextBubbleToBeShot.image = rightImage
        
        let gridCurrentBubbleToBeShot = gridViewController.bubbleToBeShotName!
        let gridNextBubbleToBeShot = gridViewController.nextBubbleToBeShotName!
        
        gridViewController.bubbleToBeShotName = gridNextBubbleToBeShot
        gridViewController.nextBubbleToBeShotName = gridCurrentBubbleToBeShot
    }
}
