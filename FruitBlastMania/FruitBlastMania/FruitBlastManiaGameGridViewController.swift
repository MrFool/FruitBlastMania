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
    
    func resetGridInitial() {
        for cell in self.collectionView!.visibleCells() as [GridCollectionViewCell] {
            for view in cell.subviews {
                view.removeFromSuperview()
            }
            
            cell.bubbleAttached = nil
        }
    }
    
    func resetGrid() {
        for cell in self.collectionView!.visibleCells() as [GridCollectionViewCell] {
            cell.bubbleAttached = nil
        }
    }
    
    func snapToClosestCell(aMovingBubble: ProjectileBubble) {
//        var sortedDistance: [(NSIndexPath, CGFloat)] = [(NSIndexPath, CGFloat)]()
//        
//        func insertPathSorted(pathToInsert: NSIndexPath, distanceToInsert: CGFloat) {
//            var indexToInsertAt = 0
//            
//            if sortedDistance.isEmpty {
//                sortedDistance.append((pathToInsert, distanceToInsert))
//            } else {
//                let numberOfPathsInsertedBefore = sortedDistance.count
//                
//                while indexToInsertAt < numberOfPathsInsertedBefore && sortedDistance[indexToInsertAt].1 < distanceToInsert {
//                    indexToInsertAt++
//                }
//                
//                sortedDistance.insert((pathToInsert, distanceToInsert), atIndex: indexToInsertAt)
//            }
//        }
//        
//        func distanceBetweenTwoPoints(pointA: CGPoint, pointB: CGPoint) -> CGFloat {
//            let xDistance: Float = fabsf(Float(pointA.x) - Float(pointB.x))
//            let yDistance: Float = fabsf(Float(pointA.y) - Float(pointB.y))
//            
//            let absDistance:Float = sqrt(((xDistance * xDistance) + (yDistance * yDistance)))
//            // TA:  A little overlap with your collision detection in your game engine
//            //      Can take out and put inside the Utils class we talked about in PS3.
//            return CGFloat(absDistance)
//        }
//        
//        let currentBallPoint = aMovingBubble.centerPoint!
//        
//        let collectionViewOfCells = self.collectionView
//        
//        for cell in collectionViewOfCells!.visibleCells() as [GridCollectionViewCell] {
//            insertPathSorted(collectionViewOfCells!.indexPathForCell(cell)!, distanceBetweenTwoPoints(currentBallPoint, cell.center))
//        }
//        
//        let closestCellIndexPathToSnapTo = sortedDistance[0].0
//        
//        let cellToSnapTo = collectionViewOfCells!.cellForItemAtIndexPath(closestCellIndexPathToSnapTo) as GridCollectionViewCell
//        
//        var newBubbleFileName: String?
//        var newBubbleObject: ColorBubble?
//        
//        switch aMovingBubble.getBubbleName() {
//        case "blue":
//            newBubbleFileName = BubblePhysicsConstants.blueBubbleFileName
//            newBubbleObject = ColorBubble(nameGiven: "blue", bodyCenter: cellToSnapTo.center, anIndexPath: closestCellIndexPathToSnapTo)
//        case "red":
//            newBubbleFileName = BubblePhysicsConstants.redBubbleFileName
//            newBubbleObject = ColorBubble(nameGiven: "red", bodyCenter: cellToSnapTo.center, anIndexPath: closestCellIndexPathToSnapTo)
//        case "orange":
//            newBubbleFileName = BubblePhysicsConstants.orangeBubbleFileName
//            newBubbleObject = ColorBubble(nameGiven: "orange", bodyCenter: cellToSnapTo.center, anIndexPath: closestCellIndexPathToSnapTo)
//        case "green":
//            newBubbleFileName = BubblePhysicsConstants.greenBubbleFileName
//            newBubbleObject = ColorBubble(nameGiven: "green", bodyCenter: cellToSnapTo.center, anIndexPath: closestCellIndexPathToSnapTo)
//        default:
//            break
//        }
//        
//        let bubbleImage = UIImage(named: newBubbleFileName!)
//        let imageView = UIImageView(image: bubbleImage)
//        
//        imageView.frame.size.width = BubblePhysicsConstants.bubbleWidth
//        imageView.frame.size.height = BubblePhysicsConstants.bubbleHeight
//        
//        cellToSnapTo.addSubview(imageView)
//        
//        cellToSnapTo.bubbleAttached = newBubbleObject
//        
//        gameEngine!.bubbleSnapped(newBubbleObject!, aCollectionView: self.collectionView!)
//        
//        // clean up after snapping + animations
//        
//        let allCells = self.collectionView!.visibleCells() as [GridCollectionViewCell]
//        let cellsThatNeedsToHaveTheirBubblesRemoved: [NSIndexPath] = gameEngine!.bubblesToPopAfterSnapping(newBubbleObject!)
//        
//        for cellIndexPath in cellsThatNeedsToHaveTheirBubblesRemoved {
//            var cellToAnimate = self.collectionView!.cellForItemAtIndexPath(cellIndexPath) as GridCollectionViewCell
//            
//            for bubbleView in cellToAnimate.subviews as [UIImageView] {
//                var newBubbleView = UIImageView(frame: CGRect(x: cellToAnimate.center.x - CGFloat(BubblePhysicsConstants.bubbleRadius), y: cellToAnimate.center.y - CGFloat(BubblePhysicsConstants.bubbleRadius), width: BubblePhysicsConstants.bubbleWidth, height: BubblePhysicsConstants.bubbleWidth))
//                
//                newBubbleView.image = bubbleView.image!
//                
//                self.collectionView!.addSubview(newBubbleView)
//                
//                bubbleView.removeFromSuperview()
//                
//                UIView.animateWithDuration(0.375, delay: 0.0, options: .CurveEaseOut, animations: {
//                    newBubbleView.frame.size.width = BubblePhysicsConstants.bubbleWidth + BubblePhysicsConstants.expansionRadius
//                    newBubbleView.frame.size.height = BubblePhysicsConstants.bubbleHeight + BubblePhysicsConstants.expansionRadius
//                    newBubbleView.alpha = 0
//                    }, completion: { finished in
//                        newBubbleView.removeFromSuperview()
//                })
//            }
//            
//            cellToAnimate.bubbleAttached = nil
//        }
//        
//        if !cellsThatNeedsToHaveTheirBubblesRemoved.isEmpty {
//            let cellsThatNeedsToHaveTheirBubblesAnimateDownwards: [NSIndexPath] = gameEngine!.unattachedBubbles()
//            
//            for cellToCheckIndexPath in cellsThatNeedsToHaveTheirBubblesAnimateDownwards {
//                var cellToAnimate =  self.collectionView!.cellForItemAtIndexPath(cellToCheckIndexPath) as GridCollectionViewCell
//                
//                for bubbleView in cellToAnimate.subviews as [UIImageView] {
//                    var newBubbleView = UIImageView(frame: CGRect(x: cellToAnimate.center.x - CGFloat(BubblePhysicsConstants.bubbleRadius), y: cellToAnimate.center.y - CGFloat(BubblePhysicsConstants.bubbleRadius), width: BubblePhysicsConstants.bubbleWidth, height: BubblePhysicsConstants.bubbleWidth))
//                    
//                    newBubbleView.image = bubbleView.image!
//                    
//                    self.collectionView!.addSubview(newBubbleView)
//                    
//                    bubbleView.removeFromSuperview()
//                    
//                    UIView.animateWithDuration(0.875, delay: 0.25, options: .CurveEaseIn, animations: {
//                        newBubbleView.center.y = CGFloat(BubblePhysicsConstants.deviceBottomBarrier) + CGFloat(BubblePhysicsConstants.bubbleHeight)
//                        // TA:  This is not how physics work. According to your
//                        //      code, bubbles that are not at the same row will
//                        //      reach the bottom of the device at the same time.
//                        //      If you throw a ball down from 11th floor and from
//                        //      5th floor. They shouldn't reach the ground floor
//                        //      at the same time right?
//                        //      Simple increment the y-value by the device height
//                        //      to ensure that the top row bubbles will definitely
//                        //      be out of the screen after dropping. We can ignore
//                        //      gravitational acceleration.
//                        }, completion: { finished in
//                            newBubbleView.removeFromSuperview()
//                    })
//                }
//                
//                cellToAnimate.bubbleAttached = nil
//            }
//        }
    }
    
    func checkForCollisionWithOtherBubbles(theMovingBubble: ProjectileBubble) {
        let allCells = self.collectionView!.visibleCells() as [GridCollectionViewCell]
        
        for cell in allCells {
            if cell.bubbleAttached != nil {
                if gameEngine!.isCollided(theMovingBubble, staticBubblePoint: cell.center) {
                    isBubbleShooting = false
                    
                    snapToClosestCell(theMovingBubble)
                    
                    break
                    // do not remove, to ensure that even if the projectile 
                    // collided with multiple bubbles, it only snaps once
                }
            }
        }
    }
    
    func currentlyNoBubbleToBeShot() -> Bool {
        for viewController in self.parentViewController!.childViewControllers {
            if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
                
                if thatViewController.currentBubbleToBeShot.image == nil {
                    return true
                }
                
                return false
            }
        }
        
        // should never reach here but if we do, falsify it, 
        // I wish I can throw an exception and provide an error
        // message saying that the view controller is somehow missing? :\
        return false
    }
    
    func addNewBubbleToShooter() {
//        for viewController in self.parentViewController!.childViewControllers {
//            if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
//                let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
//                let aNewRandomBubbleName = gameEngine!.generateBubbleToBeShotName()
//                
//                var newBubbleFileName: String?
//                
//                switch aNewRandomBubbleName {
//                case "blue":
//                    newBubbleFileName = FruitBlastManiaConstants.blueBubbleFileName
//                case "red":
//                    newBubbleFileName = FruitBlastManiaConstants.redBubbleFileName
//                case "orange":
//                    newBubbleFileName = FruitBlastManiaConstants.orangeBubbleFileName
//                case "green":
//                    newBubbleFileName = FruitBlastManiaConstants.greenBubbleFileName
//                default:
//                    break
//                }
//                
//                bubbleToBeShotName = aNewRandomBubbleName
//                
//                let bubbleImage = UIImage(named: newBubbleFileName!)
//                
//                thatViewController.currentBubbleToBeShot.image = bubbleImage
//            }
//        }
    }
    
    func removeCurrentlyShotBubble() {
        if let doesShotBubbleExist = self.view.viewWithTag(FruitBlastManiaConstants.shotBubbleTag) {
            self.view.viewWithTag(FruitBlastManiaConstants.shotBubbleTag)!.removeFromSuperview()
        }
    }
    
    func updateGame() {
        // by here, the current level name in the parent view controller is already set
        // from there, build the basic level
//        if sampleLevel == nil {
//            sampleLevel = BasicLevel()
//            sampleLevel!.buildTestLevel()
//        }
//        
//        if gameEngine == nil {
//            gameEngine = BubblePhysicsGameEngine(aLevel: sampleLevel!, aCollectionView: self.collectionView!)
//            
//            resetGridInitial()
//            
//            let currentLevel = gameEngine!.currentLevel!
//            
//            for key in currentLevel.collectionOfBubbles.keys {
//                let cellToUpdate = self.collectionView!.cellForItemAtIndexPath(key) as GridCollectionViewCell
//                var newBubbleFileName: String?
//                var newBubbleObject: ColorBubble?
//                
//                switch currentLevel.collectionOfBubbles[key]! {
//                case "blue":
//                    newBubbleFileName = BubblePhysicsConstants.blueBubbleFileName
//                    newBubbleObject = ColorBubble(nameGiven: "blue", bodyCenter: cellToUpdate.center, anIndexPath: key)
//                case "red":
//                    newBubbleFileName = BubblePhysicsConstants.redBubbleFileName
//                    newBubbleObject = ColorBubble(nameGiven: "red", bodyCenter: cellToUpdate.center, anIndexPath: key)
//                case "orange":
//                    newBubbleFileName = BubblePhysicsConstants.orangeBubbleFileName
//                    newBubbleObject = ColorBubble(nameGiven: "orange", bodyCenter: cellToUpdate.center, anIndexPath: key)
//                case "green":
//                    newBubbleFileName = BubblePhysicsConstants.greenBubbleFileName
//                    newBubbleObject = ColorBubble(nameGiven: "green", bodyCenter: cellToUpdate.center, anIndexPath: key)
//                default:
//                    break
//                }
//                
//                let bubbleImage = UIImage(named: newBubbleFileName!)
//                let imageView = UIImageView(image: bubbleImage)
//                
//                imageView.frame.size.width = BubblePhysicsConstants.bubbleWidth
//                imageView.frame.size.height = BubblePhysicsConstants.bubbleHeight
//                
//                cellToUpdate.addSubview(imageView)
//                cellToUpdate.bubbleAttached = newBubbleObject
//            }
//        }
//        
//        if isBubbleShooting {
//            if gameEngine!.didCollideWithTopWall(currentlyShotBubble!)  {
//                isBubbleShooting = false
//                snapToClosestCell(currentlyShotBubble!)
//            }
//            
//            checkForCollisionWithOtherBubbles(currentlyShotBubble!)
//            
//            if gameEngine!.didCollideWithLeftWall(currentlyShotBubble!) {
//                currentlyShotBubble!.xSpeed = -currentlyShotBubble!.xSpeed!
//            }
//            
//            if gameEngine!.didCollideWithRightWall(currentlyShotBubble!) {
//                currentlyShotBubble!.xSpeed = -currentlyShotBubble!.xSpeed!
//            }
//            
//            removeCurrentlyShotBubble()
//            
//            currentlyShotBubble!.centerPoint!.x += CGFloat(currentlyShotBubble!.xSpeed!)
//            currentlyShotBubble!.centerPoint!.y += CGFloat(-currentlyShotBubble!.ySpeed!)
//            
//            var newBubbleFileName: String?
//            var newBubbleObject: ProjectileBubble?
//            
//            switch currentlyShotBubble!.getBubbleName() {
//            case "blue":
//                newBubbleFileName = BubblePhysicsConstants.blueBubbleFileName
//                newBubbleObject = ProjectileBubble(nameGiven: "blue", xSpeed: BubblePhysicsConstants.projectileVelocity, ySpeed: BubblePhysicsConstants.projectileVelocity, bodyCenter: currentlyShotBubble!.centerPoint!)
//            case "red":
//                newBubbleFileName = BubblePhysicsConstants.redBubbleFileName
//                newBubbleObject = ProjectileBubble(nameGiven: "red", xSpeed: BubblePhysicsConstants.projectileVelocity, ySpeed: BubblePhysicsConstants.projectileVelocity, bodyCenter: currentlyShotBubble!.centerPoint!)
//            case "orange":
//                newBubbleFileName = BubblePhysicsConstants.orangeBubbleFileName
//                newBubbleObject = ProjectileBubble(nameGiven: "orange", xSpeed: BubblePhysicsConstants.projectileVelocity, ySpeed: BubblePhysicsConstants.projectileVelocity, bodyCenter: currentlyShotBubble!.centerPoint!)
//            case "green":
//                newBubbleFileName = BubblePhysicsConstants.greenBubbleFileName
//                newBubbleObject = ProjectileBubble(nameGiven: "green", xSpeed: BubblePhysicsConstants.projectileVelocity, ySpeed: BubblePhysicsConstants.projectileVelocity, bodyCenter: currentlyShotBubble!.centerPoint!)
//            default:
//                break
//            }
//            
//            let bubbleImage = UIImage(named: newBubbleFileName!)
//            let imageView = UIImageView(image: bubbleImage)
//            
//            imageView.frame.size.width = BubblePhysicsConstants.bubbleWidth
//            imageView.frame.size.height = BubblePhysicsConstants.bubbleHeight
//            imageView.center = currentlyShotBubble!.centerPoint!
//            imageView.tag = BubblePhysicsConstants.shotBubbleTag
//            
//            self.view.addSubview(imageView)
//        } else {
//            if currentlyNoBubbleToBeShot() {
//                addNewBubbleToShooter()
//            }
//            
//            removeCurrentlyShotBubble()
//        }
//        
//        resetGrid()
//        
//        let currentLevel = gameEngine!.currentLevel!
//        
//        for key in currentLevel.collectionOfBubbles.keys {
//            let cellToUpdate = self.collectionView!.cellForItemAtIndexPath(key) as GridCollectionViewCell
//            var newBubbleFileName: String?
//            var newBubbleObject: ColorBubble?
//            
//            switch currentLevel.collectionOfBubbles[key]! {
//            case "blue":
//                newBubbleFileName = BubblePhysicsConstants.blueBubbleFileName
//                newBubbleObject = ColorBubble(nameGiven: "blue", bodyCenter: cellToUpdate.center, anIndexPath: key)
//            case "red":
//                newBubbleFileName = BubblePhysicsConstants.redBubbleFileName
//                newBubbleObject = ColorBubble(nameGiven: "red", bodyCenter: cellToUpdate.center, anIndexPath: key)
//            case "orange":
//                newBubbleFileName = BubblePhysicsConstants.orangeBubbleFileName
//                newBubbleObject = ColorBubble(nameGiven: "orange", bodyCenter: cellToUpdate.center, anIndexPath: key)
//            case "green":
//                newBubbleFileName = BubblePhysicsConstants.greenBubbleFileName
//                newBubbleObject = ColorBubble(nameGiven: "green", bodyCenter: cellToUpdate.center, anIndexPath: key)
//            default:
//                break
//            }
//            // TA:  FOURTH time I'm seeing this switch case here. Create a Factory
//            //      class to handle creation of your bubbles!
//            //      Too much repeated code: -2 marks
//            
//            //      Obviously you copied and pasted without giving it much thought.
//            //      newBubbleFileName is not even used here.
//            
//            cellToUpdate.bubbleAttached = newBubbleObject
//        }
    }
}
