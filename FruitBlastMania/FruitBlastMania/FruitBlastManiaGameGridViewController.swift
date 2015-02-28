/*
    This is the game grid view controller that is contained within the
    game main view controller
*/

import UIKit

class FruitBlastManiaGameGridViewController: UICollectionViewController {
    let defaultLayout: BasicGridFlowLayout = BasicGridFlowLayout()
    let defaultGrid: BasicGrid = BasicGrid()
    let reuseIdentifier = "gameBubbleCell"
    
    var numUtils = NumberUtilities()
    var gameEngine: GameEngine?
    
    var isBubbleShooting: Bool = false
    var currentlyShotBubble: ProjectileBubble?
    var bubbleToBeShotName: String?
    
    var currentLevel: BasicLevel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.registerClass(GridCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Set the layout to our custom flow layout
        self.collectionView!.collectionViewLayout = defaultLayout
        
        // Gesture(s)
        let singleTapGesture = UITapGestureRecognizer(target: self, action: Selector("singleTapHandler:"))
        singleTapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapGesture)
        
        // Game Loop
        var timer = NSTimer.scheduledTimerWithTimeInterval(
            FruitBlastManiaConstants.refreshTimer60fps,
            target: self, selector: Selector("updateGame"),
            userInfo: nil,
            repeats: true
        )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return defaultGrid.numberOfSections
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if numUtils.isOdd(section) {
            return defaultGrid.numberOfBubblesOnOddRows
        } else {
            return defaultGrid.numberOfBubblesOnEvenRows
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as GridCollectionViewCell
        
        // Cell Configuration(s)
        cell.frame.size.height = FruitBlastManiaConstants.bubbleHeight
        cell.frame.size.width = FruitBlastManiaConstants.bubbleWidth
        cell.layer.cornerRadius = cell.frame.size.width / 2
        
        return cell
    }
    
    func singleTapHandler(sender: UITapGestureRecognizer) {
        let tappedLocation = sender.locationInView(self.collectionView)
        
        if bubbleToBeShotName != nil {
            if !isBubbleShooting {
                isBubbleShooting = true
                
                for viewController in self.parentViewController!.childViewControllers {
                    if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                        let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
                        
                        thatViewController.currentBubbleToBeShot.image = nil
                    }
                }
                
                let xySpeed: (Float, Float) = gameEngine!.assignVelocityToProjectile(tappedLocation)
                
                currentlyShotBubble = ProjectileBubble(
                    nameGiven: bubbleToBeShotName!,
                    xSpeed: xySpeed.0,
                    ySpeed: xySpeed.1,
                    bodyCenter: FruitBlastManiaConstants.projectileInitialStartPoint
                )
                
                bubbleToBeShotName = nil
            }
        }
    }
}
