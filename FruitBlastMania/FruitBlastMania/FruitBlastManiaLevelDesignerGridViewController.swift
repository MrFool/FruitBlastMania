/*
    This is the level designer grid view controller that is contained within the level designer
    main view controller
*/

import UIKit

class FruitBlastManiaLevelDesignerGridViewController: UICollectionViewController {
    let defaultLayout: BasicGridFlowLayout = BasicGridFlowLayout()
    let defaultGrid: BasicGrid = BasicGrid()
    let reuseIdentifier = "designerBubbleCell"
    
    var numUtils = NumberUtilities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.registerClass(GridCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Set the layout to our custom flow layout
        self.collectionView!.collectionViewLayout = defaultLayout
        
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("panHandler:"))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        view.addGestureRecognizer(panGesture)
        
        let singleTapGesture = UITapGestureRecognizer(target: self, action: Selector("singleTapHandler:"))
        singleTapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: Selector("longPressHandler:"))
        longPressGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(longPressGesture)

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
        
        // Cell Configuration
        cell.frame.size.height = FruitBlastManiaConstants.bubbleHeight
        cell.frame.size.width = FruitBlastManiaConstants.bubbleWidth
        cell.layer.cornerRadius = cell.frame.size.width / 2
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = FruitBlastManiaConstants.unfilledBubbleBorderWidth
        cell.backgroundColor = FruitBlastManiaConstants.unfilledBubbleColor
        
        return cell
    }
    
    func resetGrid() {
        for cell in self.collectionView?.visibleCells() as [GridCollectionViewCell] {
            for view in cell.subviews {
                view.removeFromSuperview()
            }
            
            cell.bubbleAttached = nil
        }
    }
    
    // MARK: Gesture funcs
    
    func panHandler(sender: UIPanGestureRecognizer) {
        let tappedLocation = sender.locationInView(self.collectionView)
        let indexPath = self.collectionView!.indexPathForItemAtPoint(tappedLocation)
        
        if indexPath != nil {
            let selectedCell = self.collectionView!.cellForItemAtIndexPath(indexPath!) as GridCollectionViewCell
            
            let mainViewController = self.parentViewController! as FruitBlastManiaLevelDesignerViewMainController
            
            let paletteViewController = mainViewController.childViewControllers[1] as FruitBlastManiaPaletteViewController
            
            let currentlySelectedButton = paletteViewController.selectedPaletteBubble
            
            if currentlySelectedButton != nil {
                if paletteViewController.eraserIsCurrentlySelected {
                    for view in selectedCell.subviews {
                        view.removeFromSuperview()
                    }
                    
                    selectedCell.bubbleAttached = nil
                } else {
                    let bubbleImage = currentlySelectedButton!.imageView!.image
                    let imageView = UIImageView(image: bubbleImage)
                    
                    imageView.frame.size.width = FruitBlastManiaConstants.bubbleWidth
                    imageView.frame.size.height = FruitBlastManiaConstants.bubbleHeight
                    
                    for view in selectedCell.subviews {
                        view.removeFromSuperview()
                    }
                    
                    selectedCell.addSubview(imageView)
                    
                    let bodyCenterPoint: CGPoint = selectedCell.center
                    
                    selectedCell.bubbleAttached = ColorBubble(
                        nameGiven: paletteViewController.selectedPaletteBubbleName!,
                        bodyCenter: bodyCenterPoint,
                        anIndexPath: indexPath!
                    )
                }
            }
        }
    }
    
    func singleTapHandler(sender: UITapGestureRecognizer) {
        let tappedLocation = sender.locationInView(self.collectionView)
        let indexPath = self.collectionView!.indexPathForItemAtPoint(tappedLocation)
        
        if indexPath != nil {
            let selectedCell = self.collectionView!.cellForItemAtIndexPath(indexPath!) as GridCollectionViewCell
            
            let mainViewController = self.parentViewController! as FruitBlastManiaLevelDesignerViewMainController
            
            let paletteViewController = mainViewController.childViewControllers[1] as FruitBlastManiaPaletteViewController
            
            let currentlySelectedButton = paletteViewController.selectedPaletteBubble
            
            let bodyCenterPoint: CGPoint = selectedCell.center
            
            if selectedCell.bubbleAttached != nil {
                if paletteViewController.eraserIsCurrentlySelected {
                    for view in selectedCell.subviews {
                        view.removeFromSuperview()
                    }
                    
                    selectedCell.bubbleAttached = nil
                } else {
                    let currentBubbleName = selectedCell.bubbleAttached!.getBubbleName()
                    let newBubbleNameAccessor = "after" + currentBubbleName
                    let newBubbleName = FruitBlastManiaConstants.cyclingDictionary[newBubbleNameAccessor]
                    let newBubbleFileNameAccessor = newBubbleName! + "BubbleFileName"
                    let newBubbleFileName = FruitBlastManiaConstants.cyclingDictionary[newBubbleFileNameAccessor]
                    
                    for view in selectedCell.subviews {
                        view.removeFromSuperview()
                    }
                    
                    selectedCell.bubbleAttached = ColorBubble(
                        nameGiven: newBubbleName!,
                        bodyCenter: bodyCenterPoint,
                        anIndexPath: indexPath!
                    )
                    
                    let bubbleImage = UIImage(named: newBubbleFileName!)
                    let imageView = UIImageView(image: bubbleImage)
                    
                    imageView.frame.size.width = FruitBlastManiaConstants.bubbleWidth
                    imageView.frame.size.height = FruitBlastManiaConstants.bubbleHeight
                    
                    selectedCell.addSubview(imageView)
                }
            } else {
                if currentlySelectedButton != nil {
                    if paletteViewController.eraserIsCurrentlySelected {
                        for view in selectedCell.subviews {
                            view.removeFromSuperview()
                        }
                        
                        selectedCell.bubbleAttached = nil
                    } else {
                        let bubbleImage = currentlySelectedButton!.imageView!.image
                        let imageView = UIImageView(image: bubbleImage)
                        
                        imageView.frame.size.width = FruitBlastManiaConstants.bubbleWidth
                        imageView.frame.size.height = FruitBlastManiaConstants.bubbleHeight
                        
                        for view in selectedCell.subviews {
                            view.removeFromSuperview()
                        }
                        
                        selectedCell.addSubview(imageView)
                        
                        let bodyCenterPoint: CGPoint = selectedCell.center
                        
                        selectedCell.bubbleAttached = ColorBubble(
                            nameGiven: paletteViewController.selectedPaletteBubbleName!,
                            bodyCenter: bodyCenterPoint,
                            anIndexPath: indexPath!
                        )
                    }
                }
            }
        }
    }
    
    func longPressHandler(sender: UILongPressGestureRecognizer) {
        let tappedLocation = sender.locationInView(self.collectionView)
        let indexPath = self.collectionView!.indexPathForItemAtPoint(tappedLocation)
        
        if indexPath != nil {
            let selectedCell = self.collectionView?.cellForItemAtIndexPath(indexPath!) as GridCollectionViewCell
            
            for view in selectedCell.subviews {
                view.removeFromSuperview()
            }
            
            selectedCell.bubbleAttached = nil
        }
    }
}
