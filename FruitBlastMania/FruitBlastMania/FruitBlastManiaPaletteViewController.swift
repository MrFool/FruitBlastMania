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
    
    func handleSave() {
//        var inputTextField: UITextField?
//        
//        let saveAlert = UIAlertController(title: "Save", message: "Enter file name to save to, note that saving to a file that already exists will overwrite it so be sure to type correctly", preferredStyle: .Alert)
//        
//        let dismissActionHandler = { (action: UIAlertAction!) in
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }
//        
//        let saveActionHandler = { (action: UIAlertAction!) -> Void in
//            let collectionViewContainingGrid = self.childViewControllers[0].collectionView!
//            let visibleItems = collectionViewContainingGrid!.indexPathsForVisibleItems()
//            var basicLevel: BasicLevel = BasicLevel()
//            
//            for currentIndexPath in visibleItems {
//                let cell = collectionViewContainingGrid!.cellForItemAtIndexPath(currentIndexPath as NSIndexPath) as GridCollectionViewCell
//                
//                if cell.bubbleAttached != nil {
//                    basicLevel.collectionOfBubblesInBubbleNameFormat.append(cell.bubbleAttached!.getBubbleName())
//                    basicLevel.collectionOfBubblesIndexPath.append(currentIndexPath as NSIndexPath)
//                }
//            }
//            // TA:  This method contains TOO MUCH LOGIC. Write a separate FileManager class
//            //      to handle data persistence, rather than putting them all inside
//            //      the designer's main view controller.
//            if inputTextField!.text != "" {
//                var filePath = self.documentsDirectory().stringByAppendingPathComponent(inputTextField!.text + LevelDesignerConstants.levelExtension)
//                NSKeyedArchiver.archiveRootObject([basicLevel], toFile: filePath)
//                
//                self.dismissViewControllerAnimated(true, completion: nil)
//                
//                let successAlert = UIAlertController(title: "Save successful!", message: inputTextField!.text + " saved!", preferredStyle: .Alert)
//                successAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: dismissActionHandler))
//                
//                self.presentViewController(successAlert, animated: true, completion: nil)
//            } else {
//                self.dismissViewControllerAnimated(true, completion: nil)
//                
//                let errorAlert = UIAlertController(title: "Error", message: "File name to save to cannot be empty", preferredStyle: .Alert)
//                errorAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: dismissActionHandler))
//                
//                self.presentViewController(errorAlert, animated: true, completion: nil)
//            }
//        }
//        
//        saveAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: dismissActionHandler))
//        saveAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: saveActionHandler))
//        
//        saveAlert.addTextFieldWithConfigurationHandler { textField in
//            textField.placeholder = "e.g. Level1"
//            inputTextField = textField
//            textField.keyboardType = UIKeyboardType.Default
//        }
//        
//        presentViewController(saveAlert, animated: true, completion: nil)
    }
    
    func handleLoad() {
//        var inputTextField: UITextField?
//        
//        let loadAlert = UIAlertController(title: "Load", message: "Enter file name to load from", preferredStyle: .Alert)
//        
//        let dismissActionHandler = {
//            (action: UIAlertAction!) in
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }
//        
//        let loadActionHandler = { (action: UIAlertAction!) -> Void in
//            var filePath = self.documentsDirectory().stringByAppendingPathComponent(inputTextField!.text + LevelDesignerConstants.levelExtension)
//            
//            if let unarchivedLevel: [BasicLevel] = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? [BasicLevel] {
//                self.resetGrid()
//                
//                let levelToLookAt: BasicLevel = unarchivedLevel[0]
//                
//                var collectionOfBubbleNames: [String] = levelToLookAt.collectionOfBubblesInBubbleNameFormat
//                var collectionOfBubbleIndexPath: [NSIndexPath] = levelToLookAt.collectionOfBubblesIndexPath
//                
//                let iterationCount = collectionOfBubbleNames.count
//                
//                for var i = 0; i < iterationCount; i++ {
//                    var bubbleFileName: String = ""
//                    
//                    switch collectionOfBubbleNames[i] {
//                    case "blue":
//                        bubbleFileName = LevelDesignerConstants.blueBubbleFileName
//                    case "red":
//                        bubbleFileName = LevelDesignerConstants.redBubbleFileName
//                    case "orange":
//                        bubbleFileName = LevelDesignerConstants.orangeBubbleFileName
//                    case "green":
//                        bubbleFileName = LevelDesignerConstants.greenBubbleFileName
//                    default:
//                        break
//                    }
//                    
//                    let collectionView = self.childViewControllers[0].collectionView!
//                    let cellToUpdate = collectionView!.cellForItemAtIndexPath(collectionOfBubbleIndexPath[i]) as GridCollectionViewCell
//                    
//                    let bubbleImage = UIImage(named: bubbleFileName)
//                    let imageView = UIImageView(image: bubbleImage)
//                    
//                    imageView.frame.size.width = LevelDesignerConstants.bubbleWidth
//                    imageView.frame.size.height = LevelDesignerConstants.bubbleHeight
//                    
//                    cellToUpdate.bubbleAttached = ColorBubble(nameGiven: collectionOfBubbleNames[i])
//                    cellToUpdate.addSubview(imageView)
//                }
//                
//                self.dismissViewControllerAnimated(true, completion: nil)
//            } else {
//                self.dismissViewControllerAnimated(true, completion: nil)
//                
//                let errorAlert = UIAlertController(title: "Error", message: "No such file detected", preferredStyle: .Alert)
//                errorAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: dismissActionHandler))
//                
//                self.presentViewController(errorAlert, animated: true, completion: nil)
//            }
//        }
//        
//        loadAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: dismissActionHandler))
//        loadAlert.addAction(UIAlertAction(title: "Load", style: .Default, handler: loadActionHandler))
//        
//        loadAlert.addTextFieldWithConfigurationHandler { textField in
//            textField.placeholder = "e.g. Level1"
//            inputTextField = textField
//            textField.keyboardType = UIKeyboardType.Default
//        }
//        
//        presentViewController(loadAlert, animated: true, completion: nil)
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
                handleSave()
            case "Load":
                handleLoad()
            case "Reset":
                handleReset()
            default:
                break
            }
        }
    }
}
