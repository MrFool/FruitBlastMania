/*
    PhysicsBody is how we are going to represent the simple objects that we need to do just collision detection
    and movement etc.
*/

import Foundation
import UIKit

class PhysicsBody {
    var xSpeed: Float?
    var ySpeed: Float?
    var centerPoint: CGPoint?
    var radius: Int?
    
    init(speedInX aSpeedX: Float?,speedInY aSpeedY: Float?, centerPoint aPoint: CGPoint, radius aRadius: Int) {
        self.xSpeed = aSpeedX
        self.ySpeed = aSpeedY
        self.centerPoint = aPoint
        self.radius = aRadius
    }
}