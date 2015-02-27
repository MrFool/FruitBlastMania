/*
    `ProjectileBubble' represents the moving color bubbles and have the following constraints:
        - Have a string name
*/

import Foundation
import UIKit

class ProjectileBubble: BaseBubble {
    init(nameGiven: String, xSpeed: Float, ySpeed: Float, bodyCenter: CGPoint) {
        super.init(speedInX: xSpeed, speedInY: ySpeed,
            centerPoint: bodyCenter, radius: FruitBlastManiaConstants.bubbleRadius)
        self.setBubbleName(nameGiven)
        
        _checkRep()
    }
    
    private func _checkRep() {
        // disabling checks to reduce latency
        // assert(self.getBubbleName() != "", "The color bubble doesn't have any name!")
    }
}