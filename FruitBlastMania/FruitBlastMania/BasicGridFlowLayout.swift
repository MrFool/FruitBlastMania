/*
    BasicGridFlowLayout is the custom layout that we are using for the grid collection view to indent every 2nd row
*/

import UIKit

class BasicGridFlowLayout: UICollectionViewFlowLayout {
    var numUtils = NumberUtilities()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        
        super.itemSize = CGSize(width: FruitBlastManiaConstants.bubbleWidth,
            height: FruitBlastManiaConstants.bubbleHeight)
    }
    
    override init() {
        super.init()
        
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        
        super.itemSize = CGSize(width: FruitBlastManiaConstants.bubbleWidth,
            height: FruitBlastManiaConstants.bubbleHeight)
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        return super.layoutAttributesForItemAtIndexPath(indexPath)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        let attributes = super.layoutAttributesForElementsInRect(rect)
        
        for (index, attribute) in enumerate(attributes!) {
            let cellAttribute = attribute as? UICollectionViewLayoutAttributes
            let cellSection = cellAttribute!.indexPath.section
            
            if numUtils.isOdd(cellSection) {
                cellAttribute!.center.x += FruitBlastManiaConstants.bubbleWidth / 2
            }
            
            // TODO find a way to make the spacing between each section to be 0 instead of using such an ugly hack
            cellAttribute!.center.y -= (10 * CGFloat(cellSection))
        }
        
        return attributes
    }
}