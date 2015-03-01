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
        if segue.destinationViewController.title == FruitBlastManiaConstants.gameMainViewControllerTitle {
            var basicLevelToPassOver: BasicLevel = BasicLevel()
            
            let thatViewController = segue.destinationViewController as FruitBlastManiaGameViewMainController

            let parentViewController = self.parentViewController! as FruitBlastManiaLevelDesignerViewMainController
            
            let gridViewController = parentViewController.childViewControllers[0] as FruitBlastManiaLevelDesignerGridViewController
            
            let visibleItems = gridViewController.collectionView!.indexPathsForVisibleItems()
            
            for currentIndexPath in visibleItems {
                let cell = gridViewController.collectionView!.cellForItemAtIndexPath(currentIndexPath as NSIndexPath) as GridCollectionViewCell

                if cell.bubbleAttached != nil {
                    let anIndexPath = currentIndexPath as NSIndexPath
                    
                    basicLevelToPassOver.collectionOfBubbles[anIndexPath] = cell.bubbleAttached!.getBubbleName()
                }
            }
            
            thatViewController.currentLevelName = FruitBlastManiaConstants.customLevel
            thatViewController.currentLevel = basicLevelToPassOver
        }
    }
    
    func handleReset() {
        let mainViewController = self.parentViewController! as FruitBlastManiaLevelDesignerViewMainController
        
        let gridViewController = mainViewController.childViewControllers[0] as FruitBlastManiaLevelDesignerGridViewController
        
        gridViewController.resetGrid()
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
                let parentViewController = self.parentViewController! as FruitBlastManiaLevelDesignerViewMainController
                
                parentViewController.handleSave()
            case "Load":
                let parentViewController = self.parentViewController! as FruitBlastManiaLevelDesignerViewMainController
                
                parentViewController.handleLoad()
            case "Reset":
                handleReset()
            default:
                break
            }
        }
    }
}
