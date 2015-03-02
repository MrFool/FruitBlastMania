/*
    This is the game grid view controller that is contained within the
    game main view controller
*/

import UIKit
import Social

class FruitBlastManiaGameGridViewController: UICollectionViewController {
    let defaultLayout: BasicGridFlowLayout = BasicGridFlowLayout()
    let defaultGrid: BasicGrid = BasicGrid()
    let reuseIdentifier = "gameBubbleCell"
    
    var numUtils = NumberUtilities()
    var bubbleFactory = BubbleFactory()
    var gameEngine: GameEngine?
    var thisCurrentLevel: BasicLevel?
    
    var isBubbleShooting: Bool = false
    var currentlyShotBubble: ProjectileBubble?
    var mostRecentlySnappedBubble: ColorBubble?
    var nextBubbleToBeShotName: String?
    var bubbleToBeShotName: String?
    
    var isCannonAnimating: Bool = false
    var shouldAnimateCannonPauser1: Bool = false
    var shouldAnimateCannonPauser2: Bool = false
    var currentCannonAnimation: Int = 0
    var cannonAnimationAngle: CGFloat = 0
    
    var isGameInitialised: Bool = false
    var waitCountBeforeInitialising: Int = 10
    var quitIsPressed: Bool = false
    
    var specialBubbleEffects: Queue<ColorBubble> = Queue<ColorBubble>()
    
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
    
    // MARK: Helper functions to help with the game loop
    
    func snapToClosestCell(aMovingBubble: ProjectileBubble) {
        removeCurrentlyShotBubble()
        
        var sortedDistance: [(NSIndexPath, CGFloat)] = [(NSIndexPath, CGFloat)]()
        
        func insertPathSorted(pathToInsert: NSIndexPath, distanceToInsert: CGFloat) {
            var indexToInsertAt = 0
            
            if sortedDistance.isEmpty {
                sortedDistance.append((pathToInsert, distanceToInsert))
            } else {
                let numberOfPathsInsertedBefore = sortedDistance.count
                
                while indexToInsertAt < numberOfPathsInsertedBefore && sortedDistance[indexToInsertAt].1 < distanceToInsert {
                    indexToInsertAt++
                }
                
                sortedDistance.insert((pathToInsert, distanceToInsert), atIndex: indexToInsertAt)
            }
        }

        func distanceBetweenTwoPoints(pointA: CGPoint, pointB: CGPoint) -> CGFloat {
            let xDistance: Float = fabsf(Float(pointA.x) - Float(pointB.x))
            let yDistance: Float = fabsf(Float(pointA.y) - Float(pointB.y))
            
            let absDistance:Float = sqrt(((xDistance * xDistance) + (yDistance * yDistance)))
            return CGFloat(absDistance)
        }
        
        let currentBallPoint = aMovingBubble.centerPoint!
        
        let collectionViewOfCells = self.collectionView
        
        for cell in collectionViewOfCells!.visibleCells() as [GridCollectionViewCell] {
            insertPathSorted(
                collectionViewOfCells!.indexPathForCell(cell)!,
                distanceBetweenTwoPoints(currentBallPoint, cell.center)
            )
        }
        
        let closestCellIndexPathToSnapTo = sortedDistance[0].0
        
        let cellToSnapTo = collectionViewOfCells!.cellForItemAtIndexPath(closestCellIndexPathToSnapTo) as GridCollectionViewCell
        
        let bubbleName = aMovingBubble.getBubbleName()
        
        let createdBubbleValues: (String, ColorBubble) = bubbleFactory.createBubble(bubbleName,
            aPoint: cellToSnapTo.center,
            anIndexPath: closestCellIndexPathToSnapTo
        )
        
        let bubbleImage = UIImage(named: createdBubbleValues.0)
        let imageView = UIImageView(image: bubbleImage)
        
        imageView.frame.size.width = FruitBlastManiaConstants.bubbleWidth
        imageView.frame.size.height = FruitBlastManiaConstants.bubbleHeight
        
        if cellToSnapTo.bubbleAttached == nil ||
            (closestCellIndexPathToSnapTo.section == 0 && cellToSnapTo.bubbleAttached != nil) {
            cellToSnapTo.addSubview(imageView)
            
            cellToSnapTo.bubbleAttached = createdBubbleValues.1
            
            mostRecentlySnappedBubble = createdBubbleValues.1
            
            gameEngine!.bubbleSnapped(createdBubbleValues.1, aCollectionView: self.collectionView!)
            
            // clean up after snapping + animations
            
            let allCells = self.collectionView!.visibleCells() as [GridCollectionViewCell]
            let cellsThatNeedsToHaveTheirBubblesRemoved: [NSIndexPath] = gameEngine!.bubblesToPopAfterSnapping(createdBubbleValues.1)
            
            let specialBubbles: [ColorBubble] = gameEngine!.checkForSpecialBubbles(createdBubbleValues.1)
            
            for bubble in specialBubbles {
                specialBubbleEffects.enqueue(bubble)
            }
            
            for cellIndexPath in cellsThatNeedsToHaveTheirBubblesRemoved {
                animateBurst(cellIndexPath)
            }
            
            if !cellsThatNeedsToHaveTheirBubblesRemoved.isEmpty {
                removeHangingBubbles()
            }
        } else {
            handleLoseOutOfBounds()
        }
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
        if gameEngine!.numberOfBubbles > 0 {
            for viewController in self.parentViewController!.childViewControllers {
                if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                    let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
                    let aNewRandomBubbleName1 = gameEngine!.generateBubbleToBeShotName()
                    
                    var newBubbleFileName1: String = bubbleFactory.createBubble(aNewRandomBubbleName1)
                    
                    bubbleToBeShotName = nextBubbleToBeShotName
                    
                    let bubbleImage1 = UIImage(named: newBubbleFileName1)
                    
                    thatViewController.currentBubbleToBeShot.image = thatViewController.nextBubbleToBeShot.image
                    thatViewController.nextBubbleToBeShot.image = bubbleImage1
                    
                    nextBubbleToBeShotName = aNewRandomBubbleName1
                    
                    if !gameEngine!.isValidBubble(bubbleToBeShotName!) {
                        let aNewRandomBubbleName2 = gameEngine!.generateBubbleToBeShotName()
                        
                        var newBubbleFileName2: String = bubbleFactory.createBubble(aNewRandomBubbleName2)
                        
                        bubbleToBeShotName = aNewRandomBubbleName2
                        
                        let bubbleImage2 = UIImage(named: newBubbleFileName2)
                        
                        thatViewController.currentBubbleToBeShot.image = bubbleImage2
                    }
                }
            }
        }
        
        if gameEngine!.numberOfBubbles == 0 {
            for viewController in self.parentViewController!.childViewControllers {
                if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                    let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
                    
                    bubbleToBeShotName = nextBubbleToBeShotName
                    
                    thatViewController.currentBubbleToBeShot.image = thatViewController.nextBubbleToBeShot.image
                    thatViewController.nextBubbleToBeShot.image = nil
                }
            }

        }
        
        gameEngine!.decrementBubbleCount()
    }
    
    func addInitialBubbleToShooter() {
        for viewController in self.parentViewController!.childViewControllers {
            if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
                let aNewRandomBubbleName = gameEngine!.generateBubbleToBeShotName()
                
                var newBubbleFileName: String = bubbleFactory.createBubble(aNewRandomBubbleName)
                
                nextBubbleToBeShotName = aNewRandomBubbleName
                
                let bubbleImage = UIImage(named: newBubbleFileName)
                
                thatViewController.nextBubbleToBeShot.image = bubbleImage
            }
        }
        
        gameEngine!.decrementBubbleCount()
    }
    
    func removeCurrentlyShotBubble() {
        if let doesShotBubbleExist = self.view.viewWithTag(FruitBlastManiaConstants.shotBubbleTag) {
            self.view.viewWithTag(FruitBlastManiaConstants.shotBubbleTag)!.removeFromSuperview()
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
    
    func removeHangingBubbles() {
        let cellsThatNeedsToHaveTheirBubblesAnimateDownwards: [NSIndexPath] = gameEngine!.unattachedBubbles()
        
        for cellToCheckIndexPath in cellsThatNeedsToHaveTheirBubblesAnimateDownwards {
            var cellToAnimate =  self.collectionView!.cellForItemAtIndexPath(cellToCheckIndexPath) as GridCollectionViewCell
            
            for bubbleView in cellToAnimate.subviews as [UIImageView] {
                var newBubbleView = UIImageView(
                    frame: CGRect(
                        x: cellToAnimate.center.x - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                        y: cellToAnimate.center.y - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                        width: FruitBlastManiaConstants.bubbleWidth,
                        height: FruitBlastManiaConstants.bubbleWidth
                    )
                )
                
                newBubbleView.image = bubbleView.image!
                
                self.collectionView!.addSubview(newBubbleView)
                
                bubbleView.removeFromSuperview()
                
                UIView.animateWithDuration(0.875,
                    delay: 0.25,
                    options: .CurveEaseIn,
                    animations: {
                        newBubbleView.center.y += CGFloat(FruitBlastManiaConstants.deviceHeight)
                    }, completion: { finished in
                        newBubbleView.removeFromSuperview()
                })
            }
            
            cellToAnimate.bubbleAttached = nil
        }

    }
    
    func updateBubbleCount() {
        for viewController in self.parentViewController!.childViewControllers {
            if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
               
                if gameEngine!.numberOfBubbles >= 0 {
                    thatViewController.bubbleNumber.text = String(gameEngine!.numberOfBubbles)
                } else {
                    thatViewController.bubbleNumber.text = "0"
                }
            }
        }
    }
    
    func initialiseGame() {
        resetGridInitial()
        
        let parentViewController = self.parentViewController! as FruitBlastManiaGameViewMainController
        
        let theLevelName: String = parentViewController.currentLevelName!
        
        switch theLevelName {
        case FruitBlastManiaConstants.levelOne:
            thisCurrentLevel = BasicLevel()
            thisCurrentLevel!.buildLevelOne()
            
            parentViewController.currentLevel = BasicLevel()
            parentViewController.currentLevel!.buildLevelOne()
        case FruitBlastManiaConstants.levelTwo:
            thisCurrentLevel = BasicLevel()
            thisCurrentLevel!.buildLevelTwo()
            
            parentViewController.currentLevel = BasicLevel()
            parentViewController.currentLevel!.buildLevelTwo()
        case FruitBlastManiaConstants.levelThree:
            thisCurrentLevel = BasicLevel()
            thisCurrentLevel!.buildLevelThree()
            
            parentViewController.currentLevel = BasicLevel()
            parentViewController.currentLevel!.buildLevelThree()
        case FruitBlastManiaConstants.levelFour:
            thisCurrentLevel = BasicLevel()
            thisCurrentLevel!.buildLevelFour()
            
            parentViewController.currentLevel = BasicLevel()
            parentViewController.currentLevel!.buildLevelFour()
        case FruitBlastManiaConstants.levelFive:
            thisCurrentLevel = BasicLevel()
            thisCurrentLevel!.buildLevelFive()
            
            parentViewController.currentLevel = BasicLevel()
            parentViewController.currentLevel!.buildLevelFive()
        case FruitBlastManiaConstants.coolLevel:
            thisCurrentLevel = BasicLevel()
            thisCurrentLevel!.buildCoolLevel()
            
            parentViewController.currentLevel = BasicLevel()
            parentViewController.currentLevel!.buildCoolLevel()
        case FruitBlastManiaConstants.customLevel:
            thisCurrentLevel = BasicLevel()
            
            let levelToCopyFrom = parentViewController.currentLevel!
            
            for key in levelToCopyFrom.collectionOfBubbles.keys {
                thisCurrentLevel!.collectionOfBubbles[key] = levelToCopyFrom.collectionOfBubbles[key]
            }
        default:
            break
        }
        
        gameEngine = GameEngine(aLevel: thisCurrentLevel!, aCollectionView: self.collectionView!)
        
        for key in thisCurrentLevel!.collectionOfBubbles.keys {
            let cellToUpdate = self.collectionView!.cellForItemAtIndexPath(key) as GridCollectionViewCell
            
            var bubbleName = thisCurrentLevel!.collectionOfBubbles[key]!
            
            let createdBubbleValues: (String, ColorBubble) = bubbleFactory.createBubble(bubbleName,
                aPoint: cellToUpdate.center,
                anIndexPath: key
            )
            
            let bubbleImage = UIImage(named: createdBubbleValues.0)
            let imageView = UIImageView(image: bubbleImage)
            
            imageView.frame.size.width = FruitBlastManiaConstants.bubbleWidth
            imageView.frame.size.height = FruitBlastManiaConstants.bubbleHeight
            
            cellToUpdate.addSubview(imageView)
            cellToUpdate.bubbleAttached = createdBubbleValues.1
        }
        
        updateBubbleCount()
        
        addInitialBubbleToShooter()
        
        removeHangingBubbles()
        
        isGameInitialised = true
    }
    
    func dealWithShootingBubble() {
        if gameEngine!.didCollideWithTopWall(currentlyShotBubble!)  {
            isBubbleShooting = false
            snapToClosestCell(currentlyShotBubble!)
        }
        
        checkForCollisionWithOtherBubbles(currentlyShotBubble!)
        
        if gameEngine!.didCollideWithLeftWall(currentlyShotBubble!) {
            currentlyShotBubble!.xSpeed = -currentlyShotBubble!.xSpeed!
        }
        
        if gameEngine!.didCollideWithRightWall(currentlyShotBubble!) {
            currentlyShotBubble!.xSpeed = -currentlyShotBubble!.xSpeed!
        }
        
        removeCurrentlyShotBubble()
        
        currentlyShotBubble!.centerPoint!.x += CGFloat(currentlyShotBubble!.xSpeed!)
        currentlyShotBubble!.centerPoint!.y += CGFloat(-currentlyShotBubble!.ySpeed!)
        
        let bubbleName = currentlyShotBubble!.getBubbleName()
        
        var newBubbleFileName: String = bubbleFactory.createBubble(bubbleName)
        
        let bubbleImage = UIImage(named: newBubbleFileName)
        let imageView = UIImageView(image: bubbleImage)
        
        imageView.frame.size.width = FruitBlastManiaConstants.bubbleWidth
        imageView.frame.size.height = FruitBlastManiaConstants.bubbleHeight
        imageView.center = currentlyShotBubble!.centerPoint!
        imageView.tag = FruitBlastManiaConstants.shotBubbleTag
        
        self.view.addSubview(imageView)
    }
    
    func animateCannon() {
        if isCannonAnimating {
            if shouldAnimateCannonPauser1 {
                if shouldAnimateCannonPauser2 {
                    if currentCannonAnimation == 10 {
                        isCannonAnimating = false
                    }
                    
                    var thatViewController: FruitBlastManiaBubbleShooterViewController
                    
                    currentCannonAnimation += 1
                    
                    for viewController in self.parentViewController!.childViewControllers {
                        if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                            thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
                            
                            let cannonAnimationToTransitionTo = thatViewController.arrayOfCannonImages[currentCannonAnimation]
                            
                            thatViewController.theCannon.transform = CGAffineTransformMakeRotation(cannonAnimationAngle)
                            
                            thatViewController.theCannon.image = cannonAnimationToTransitionTo
                        }
                    }
                    
                    shouldAnimateCannonPauser1 = false
                    shouldAnimateCannonPauser2 = false
                    
                    if currentCannonAnimation == 11 {
                        currentCannonAnimation = 0
                    }
                } else {
                    shouldAnimateCannonPauser2 = true
                }
            } else {
                shouldAnimateCannonPauser1 = true
            }
        } else {
            for viewController in self.parentViewController!.childViewControllers {
                if viewController.title == FruitBlastManiaConstants.shooterViewControllerTitle {
                    let thatViewController = viewController as FruitBlastManiaBubbleShooterViewController
                    
                    let cannonAnimationToTransitionTo = thatViewController.arrayOfCannonImages[0]
                    
                    thatViewController.theCannon.image = cannonAnimationToTransitionTo
                }
            }
        }
    }
    
    func animateSheep() {
        
    }
    
    func handleSpecialBubble() {
        let specialBubble = specialBubbleEffects.dequeue()
        
        switch specialBubble!.getBubbleName() {
        case FruitBlastManiaConstants.lightningBubbleName:
            let bubbleIndexPathsToBeRemoved = gameEngine!.handleLightningBubble(specialBubble!)
            
            var moreSpecialBubbles: [ColorBubble] = [ColorBubble]()
            
            for indexPath in bubbleIndexPathsToBeRemoved {
                let cellToCheck = self.collectionView!.cellForItemAtIndexPath(indexPath) as GridCollectionViewCell
                
                if let cellHasBubble = cellToCheck.bubbleAttached {
                    if gameEngine!.isSpecialBubble(cellToCheck.bubbleAttached!) {
                        moreSpecialBubbles.append(cellToCheck.bubbleAttached!)
                    }
                }
            }
            
            for bubble in moreSpecialBubbles {
                specialBubbleEffects.enqueue(bubble)
            }
            
            for cellIndexPath in bubbleIndexPathsToBeRemoved {
                animateLightning(cellIndexPath)
            }
            
            removeHangingBubbles()
        case FruitBlastManiaConstants.bombBubbleName:
            let bubbleIndexPathsToBeRemoved = gameEngine!.handleBombBubble(specialBubble!)
            
            var moreSpecialBubbles: [ColorBubble] = [ColorBubble]()
            
            for indexPath in bubbleIndexPathsToBeRemoved {
                let cellToCheck = self.collectionView!.cellForItemAtIndexPath(indexPath) as GridCollectionViewCell
                
                if let cellHasBubble = cellToCheck.bubbleAttached {
                    if gameEngine!.isSpecialBubble(cellToCheck.bubbleAttached!) {
                        moreSpecialBubbles.append(cellToCheck.bubbleAttached!)
                    }
                }
            }
            
            for bubble in moreSpecialBubbles {
                specialBubbleEffects.enqueue(bubble)
            }
            
            for cellIndexPath in bubbleIndexPathsToBeRemoved {
                animateExplosion(cellIndexPath)
            }
            
            removeHangingBubbles()
        case FruitBlastManiaConstants.starBubbleName:
            let bubbleIndexPathsToBeRemoved = gameEngine!.handleStarBubble(mostRecentlySnappedBubble!,
                aSpecialBubble: specialBubble!
            )
            
            for cellIndexPath in bubbleIndexPathsToBeRemoved {
                animateStar(cellIndexPath)
            }
            
            removeHangingBubbles()
        default:
            break
        }
    }
    
    func animateBurst(cellIndexPath: NSIndexPath) {
        var cellToAnimate = self.collectionView!.cellForItemAtIndexPath(cellIndexPath) as GridCollectionViewCell
        
        for bubbleView in cellToAnimate.subviews as [UIImageView] {
            var newBubbleView = UIImageView(
                frame: CGRect(
                    x: cellToAnimate.center.x - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    y: cellToAnimate.center.y - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    width: FruitBlastManiaConstants.bubbleWidth,
                    height: FruitBlastManiaConstants.bubbleWidth
                )
            )
            
            newBubbleView.image = bubbleView.image!
            
            self.collectionView!.addSubview(newBubbleView)
            
            bubbleView.removeFromSuperview()
            
            UIView.animateWithDuration(0.375,
                delay: 0.0,
                options: .CurveEaseOut,
                animations: {
                    newBubbleView.frame.size.width = FruitBlastManiaConstants.bubbleWidth +
                        FruitBlastManiaConstants.expansionRadius
                    newBubbleView.frame.size.height = FruitBlastManiaConstants.bubbleHeight +
                        FruitBlastManiaConstants.expansionRadius
                    newBubbleView.alpha = 0
                }, completion: { finished in
                    newBubbleView.removeFromSuperview()
            })
        }
        
        cellToAnimate.bubbleAttached = nil
    }
    
    func animateExplosion(cellIndexPath: NSIndexPath) {
        var cellToAnimate = self.collectionView!.cellForItemAtIndexPath(cellIndexPath) as GridCollectionViewCell
        
        for bubbleView in cellToAnimate.subviews as [UIImageView] {
            var animationView = UIImageView(
                frame: CGRect(
                    x: cellToAnimate.center.x - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    y: cellToAnimate.center.y - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    width: FruitBlastManiaConstants.bubbleWidth,
                    height: FruitBlastManiaConstants.bubbleWidth
                )
            )
            
            let explosionImage = UIImage(named: FruitBlastManiaConstants.explosionAnimationFileName)
            
            animationView.image = explosionImage
            
            self.collectionView!.addSubview(animationView)
            
            bubbleView.removeFromSuperview()
            
            UIView.animateWithDuration(0.75,
                delay: 0.0,
                options: .CurveEaseOut,
                animations: {
                    animationView.frame.size.width = FruitBlastManiaConstants.bubbleWidth +
                        FruitBlastManiaConstants.expansionRadius * 3
                    animationView.frame.size.height = FruitBlastManiaConstants.bubbleHeight +
                        FruitBlastManiaConstants.expansionRadius * 3
                    animationView.alpha = 0
                }, completion: { finished in
                    animationView.removeFromSuperview()
            })
        }
        
        cellToAnimate.bubbleAttached = nil
    }
    
    func animateLightning(cellIndexPath: NSIndexPath) {
        var cellToAnimate = self.collectionView!.cellForItemAtIndexPath(cellIndexPath) as GridCollectionViewCell
        
        for bubbleView in cellToAnimate.subviews as [UIImageView] {
            var animationView = UIImageView(
                frame: CGRect(
                    x: cellToAnimate.center.x - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    y: cellToAnimate.center.y - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    width: FruitBlastManiaConstants.bubbleWidth,
                    height: FruitBlastManiaConstants.bubbleWidth
                )
            )
            
            let lightningImage = UIImage(named: FruitBlastManiaConstants.lightningAnimationFileName)
            
            animationView.image = lightningImage
            
            self.collectionView!.addSubview(animationView)
            
            bubbleView.removeFromSuperview()
            
            UIView.animateWithDuration(0.1,
                delay: 0.0,
                options: .CurveEaseOut,
                animations: {
                    animationView.center.y += 16
                }, completion: { finished in
                    UIView.animateWithDuration(0.1,
                        delay: 0.0,
                        options: .CurveEaseOut,
                        animations: {
                            animationView.center.y -= 16
                        }, completion: { finished in
                            UIView.animateWithDuration(0.1,
                                delay: 0.0,
                                options: .CurveEaseOut,
                                animations: {
                                    animationView.center.y -= 16
                                }, completion: { finished in
                                    UIView.animateWithDuration(0.1,
                                        delay: 0.0,
                                        options: .CurveEaseOut,
                                        animations: {
                                            animationView.center.y += 32
                                            animationView.alpha = 0
                                        }, completion: { finished in
                                            animationView.removeFromSuperview()
                                    })
                            })
                    })
            })
        }
        
        cellToAnimate.bubbleAttached = nil
    }
    
    func animateStar(cellIndexPath: NSIndexPath) {
        var cellToAnimate = self.collectionView!.cellForItemAtIndexPath(cellIndexPath) as GridCollectionViewCell
        
        for bubbleView in cellToAnimate.subviews as [UIImageView] {
            var animationView = UIImageView(
                frame: CGRect(
                    x: cellToAnimate.center.x - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    y: cellToAnimate.center.y - CGFloat(FruitBlastManiaConstants.bubbleRadius),
                    width: FruitBlastManiaConstants.bubbleWidth,
                    height: FruitBlastManiaConstants.bubbleWidth
                )
            )
            
            let starImage = UIImage(named: FruitBlastManiaConstants.starAnimationFileName)
            
            animationView.image = starImage
            
            self.collectionView!.addSubview(animationView)
            
            bubbleView.removeFromSuperview()
            
            UIView.animateWithDuration(1.25,
                delay: 0.0,
                options: .CurveEaseOut,
                animations: {
                    animationView.alpha = 0
                }, completion: { finished in
                    animationView.removeFromSuperview()
            })
        }
        
        cellToAnimate.bubbleAttached = nil
    }
    
    func handleWin() {
        let winDismissActionHandler = { (action: UIAlertAction!) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let winAlert = UIAlertController(title: "Winner!", message: "You've won!", preferredStyle: .Alert)
        winAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: winDismissActionHandler))
        
        quitIsPressed = true
        
        presentViewController(winAlert, animated: true, completion: nil)
    }
    
    func handleLoseNoMoreBubble() {
        let winDismissActionHandler = { (action: UIAlertAction!) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let winAlert = UIAlertController(title: "No more bubbles!",
            message: "You've lost",
            preferredStyle: .Alert
        )
        winAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: winDismissActionHandler))
        
        quitIsPressed = true
        
        presentViewController(winAlert, animated: true, completion: nil)
    }
    
    func handleLoseOutOfBounds() {
        let winDismissActionHandler = { (action: UIAlertAction!) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let winAlert = UIAlertController(title: "Out of arena!",
            message: "You've lost",
            preferredStyle: .Alert
        )
        winAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: winDismissActionHandler))
        
        quitIsPressed = true
        
        presentViewController(winAlert, animated: true, completion: nil)
    }
    
    // MARK: The game loop itself
    
    func updateGame() {
        if !quitIsPressed {
            if waitCountBeforeInitialising == 0 {
                if !isGameInitialised {
                    initialiseGame()
                }
                
                if gameEngine!.didWinGame() {
                    handleWin()
                }
                
                if gameEngine!.didLoseGame() {
                    handleLoseNoMoreBubble()
                }
                
                animateCannon()
                
                animateSheep()
                
                updateBubbleCount()
                
                if isBubbleShooting {
                    dealWithShootingBubble()
                } else {
                    if !specialBubbleEffects.isEmpty {
                        handleSpecialBubble()
                    } else {
                        if currentlyNoBubbleToBeShot() {
                            addNewBubbleToShooter()
                        }
                    }
                    
                    removeCurrentlyShotBubble()
                }
            } else {
                waitCountBeforeInitialising -= 1
            }
        }
    }
    
    // MARK: Gesture func(s)
    
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
                
                let xySpeedAndAngle: (Float, Float, CGFloat, String) = gameEngine!.assignVelocityToProjectileAndGetAngle(tappedLocation)
                
                isCannonAnimating = true
                
                if xySpeedAndAngle.3 == "left" {
                    cannonAnimationAngle = CGFloat(M_PI) * 2 - xySpeedAndAngle.2
                } else {
                    cannonAnimationAngle = xySpeedAndAngle.2
                }
                
                currentlyShotBubble = ProjectileBubble(
                    nameGiven: bubbleToBeShotName!,
                    xSpeed: xySpeedAndAngle.0,
                    ySpeed: xySpeedAndAngle.1,
                    bodyCenter: FruitBlastManiaConstants.projectileInitialStartPoint
                )
                
                bubbleToBeShotName = nil
            }
        }
    }
}
