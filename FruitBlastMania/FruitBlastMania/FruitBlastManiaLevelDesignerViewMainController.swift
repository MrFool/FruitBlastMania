/*
    This is the level designer main view controller, the one to segue to that will have container views
    to contain the palette view and also the grid
*/

import UIKit

class FruitBlastManiaLevelDesignerViewMainController: UIViewController {
    var fileUtils = FileUtilities()
    var bubbleFactory = BubbleFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // TODO create a file manager to help with the file persistency to reduce the fatness
    // of this controller
    func handleSave() {
        var inputTextField: UITextField?
        
        let saveAlert = UIAlertController(title: "Save", message: "Enter file name to save to, note that saving to a file that already exists will overwrite it so be sure to type correctly", preferredStyle: .Alert)
        
        let dismissActionHandler = { (action: UIAlertAction!) in
            println("dismissed")
        }
        
        let saveActionHandler = { (action: UIAlertAction!) -> Void in
            let collectionViewContainingGrid = self.childViewControllers[0].collectionView!
            let visibleItems = collectionViewContainingGrid!.indexPathsForVisibleItems()
            var basicLevel: BasicLevel = BasicLevel()
            
            for currentIndexPath in visibleItems {
                let cell = collectionViewContainingGrid!.cellForItemAtIndexPath(currentIndexPath as NSIndexPath) as GridCollectionViewCell
                
                if cell.bubbleAttached != nil {
                    basicLevel.collectionOfBubbles[currentIndexPath as NSIndexPath] = cell.bubbleAttached!.getBubbleName()
                }
            }
            
            if inputTextField!.text != "" {
                var filePath = self.fileUtils.documentsDirectory().stringByAppendingPathComponent(inputTextField!.text +
                    FruitBlastManiaConstants.levelExtension)
                
                let manager = NSFileManager.defaultManager()
                
                var directoryPath = self.fileUtils.documentsDirectory().stringByAppendingPathComponent(
                    inputTextField!.text
                )
                
                var trueOrFalse: Bool?
                var error: NSError?
                
                if !manager.fileExistsAtPath(filePath) {
                    if !manager.createDirectoryAtPath(directoryPath,
                        withIntermediateDirectories: true,
                        attributes: nil,
                        error: &error) {
                            
                        println("Failed to create dir: \(error!.localizedDescription)")
                    }
                    
                    trueOrFalse = NSKeyedArchiver.archiveRootObject([basicLevel], toFile: filePath)
                } else {
                    trueOrFalse = NSKeyedArchiver.archiveRootObject([basicLevel], toFile: filePath)
                }
                
                let successAlert = UIAlertController(title: "Save successful!", message: inputTextField!.text + " saved!", preferredStyle: .Alert)
                successAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: dismissActionHandler))
                
                self.presentViewController(successAlert, animated: true, completion: nil)
            } else {
                let errorAlert = UIAlertController(title: "Error", message: "File name to save to cannot be empty", preferredStyle: .Alert)
                errorAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: dismissActionHandler))
                
                self.presentViewController(errorAlert, animated: true, completion: nil)
            }
        }
        
        saveAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: dismissActionHandler))
        saveAlert.addAction(UIAlertAction(title: "Save", style: .Default, handler: saveActionHandler))
        
        saveAlert.addTextFieldWithConfigurationHandler { textField in
            textField.placeholder = "e.g. Level1"
            inputTextField = textField
            textField.keyboardType = UIKeyboardType.Default
        }
        
        presentViewController(saveAlert, animated: true, completion: nil)
    }
    
    func handleLoad() {
        var inputTextField: UITextField?
        
        let loadAlert = UIAlertController(title: "Load", message: "Enter file name to load from", preferredStyle: .Alert)
        
        let dismissActionHandler = { (action: UIAlertAction!) in
            println("dismissed")
        }
        
        let loadActionHandler = { (action: UIAlertAction!) -> Void in
            var filePath = self.fileUtils.documentsDirectory().stringByAppendingPathComponent(inputTextField!.text + FruitBlastManiaConstants.levelExtension)
            
            if let unarchivedLevel: [BasicLevel] = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? [BasicLevel] {
                let gridViewController = self.childViewControllers[0] as FruitBlastManiaLevelDesignerGridViewController
                
                gridViewController.resetGrid()
                
                let levelToLookAt: BasicLevel = unarchivedLevel[0]
                
                for key in levelToLookAt.collectionOfBubbles.keys {
                    let bubbleName = levelToLookAt.collectionOfBubbles[key]
                    
                    let collectionView = self.childViewControllers[0].collectionView!
                    let cellToUpdate = collectionView!.cellForItemAtIndexPath(key) as GridCollectionViewCell
                    
                    let createdBubbleValues: (String, ColorBubble) = self.bubbleFactory.createBubble(bubbleName!,
                        aPoint: cellToUpdate.center,
                        anIndexPath: key
                    )
                    
                    let bubbleImage = UIImage(named: createdBubbleValues.0)
                    let imageView = UIImageView(image: bubbleImage)
                    
                    imageView.frame.size.width = FruitBlastManiaConstants.bubbleWidth
                    imageView.frame.size.height = FruitBlastManiaConstants.bubbleHeight
                    
                    cellToUpdate.bubbleAttached = createdBubbleValues.1
                    cellToUpdate.addSubview(imageView)
                }
            } else {
                let errorAlert = UIAlertController(title: "Error", message: "No such file detected", preferredStyle: .Alert)
                errorAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: dismissActionHandler))
                
                self.presentViewController(errorAlert, animated: true, completion: nil)
            }
        }
        
        loadAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: dismissActionHandler))
        loadAlert.addAction(UIAlertAction(title: "Load", style: .Default, handler: loadActionHandler))
        
        loadAlert.addTextFieldWithConfigurationHandler { textField in
            textField.placeholder = "e.g. Level1"
            inputTextField = textField
            textField.keyboardType = UIKeyboardType.Default
        }
        
        presentViewController(loadAlert, animated: true, completion: nil)
    }
    // TODO create a file manager to help with the file persistency to reduce the fatness
    // of this controller
}
