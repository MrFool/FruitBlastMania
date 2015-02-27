/*
    `ColorBubble' represents the non-moving color bubbles and have the following constraints:
        - Have a string name
*/

import Foundation
import UIKit

class ColorBubble: BaseBubble {
    var indexPath: NSIndexPath = NSIndexPath(forRow: 0, inSection: 999)
    
    init(nameGiven: String, bodyCenter: CGPoint, anIndexPath: NSIndexPath) {
        super.init(speedInX: nil, speedInY: nil,
            centerPoint: bodyCenter, radius: FruitBlastManiaConstants.bubbleRadius)
        
        self.setBubbleName(nameGiven)
        
        self.indexPath = anIndexPath
        
        _checkRep()
    }
    
    private func _checkRep() {
        // disabling checks to reduce latency
        // assert(self.getBubbleName() != "", "The color bubble doesn't have any name!")
    }
}


extension ColorBubble: Hashable {
    var hashValue: Int {
        return self.indexPath.hashValue
    }
}


func ==(bubbleA: ColorBubble, bubbleB: ColorBubble) -> Bool {
    return bubbleA.indexPath == bubbleB.indexPath
}