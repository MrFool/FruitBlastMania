/*
    This is the menu screen controller, the first screen that a user sees after the loading screen
*/

import UIKit
import AVFoundation

class FruitBlastManiaMainViewController: UIViewController {
    var backgroundSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(FruitBlastManiaConstants.backgroundSoundName, ofType: "wav")!)
    var backgroundSoundPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundSoundPlayer = AVAudioPlayer(contentsOfURL: backgroundSound, error: nil)
        
        backgroundSoundPlayer.numberOfLoops = -1
        backgroundSoundPlayer.prepareToPlay()
        
        backgroundSoundPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}