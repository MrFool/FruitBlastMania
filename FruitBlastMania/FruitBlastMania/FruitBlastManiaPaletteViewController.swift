/*
    This is the palette view contained within the level designer main view controller
*/

import UIKit

class FruitBlastManiaPaletteViewController: UIViewController {
    @IBOutlet weak var paletteBar: UIView!
    
    var selectedPaletteBubble: UIButton?
    var selectedPaletteBubbleName: String?
    var eraserIsCurrentlySelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.title == "Fruit Blast Mania Game View Main Controller" {
            // package up the current level as a basic level and "send it
            // to the game view controller to handle"
        }
    }
    
    func handleSave() {
        // nothing for now
    }
    
    func handleLoad() {
        // nothing for now
    }
    
    func handleReset() {
        let mainViewController = self.parentViewController! as FruitBlastManiaLevelDesignerViewMainController
        
        let gridViewController = mainViewController.childViewControllers[0] as FruitBlastManiaLevelDesignerGridViewController
        
        gridViewController.resetGrid()
    }
    
    func handlePlay() {
        // nothing for now
    }
    
    @IBAction func paletteButtonTapped(sender: UIButton) {
        let tappedButton = sender
        let selectedAlpha: CGFloat = FruitBlastManiaConstants.selectedBubbleAlpha
        let unselectedAlpha: CGFloat = FruitBlastManiaConstants.notSelectedBubbleAlpha
        
        for button in paletteBar.subviews {
            let eachButton = button as UIButton
            
            if eachButton.alpha == selectedAlpha {
                eachButton.alpha = unselectedAlpha
            }
        }
        
        selectedPaletteBubble = tappedButton
        
        tappedButton.alpha = selectedAlpha
        
        for (index, button) in enumerate(paletteBar.subviews) {
            let eachButton = button as UIButton
            
            if eachButton.alpha == selectedAlpha {
                switch index {
                case 0:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.redBubbleName
                case 1:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.orangeBubbleName
                case 2:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.greenBubbleName
                case 3:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.blueBubbleName
                case 4:
                    eraserIsCurrentlySelected = true
                    selectedPaletteBubbleName = nil
                case 5:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.indestructibleBubbleName
                case 6:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.lightningBubbleName
                case 7:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.bombBubbleName
                case 8:
                    eraserIsCurrentlySelected = false
                    selectedPaletteBubbleName = FruitBlastManiaConstants.starBubbleName
                default:
                    break
                }
            }
        }
    }
    
    @IBAction func controlButtonPressed(sender: UIButton) {
        let button = sender
        var newColor: UIColor
        
        if button.titleLabel != nil {
            switch button.titleLabel!.text! {
            case "Save":
                handleSave()
            case "Load":
                handleLoad()
            case "Reset":
                handleReset()
            case "Play This Level":
                handlePlay()
            default:
                break
            }
        }
    }
}
