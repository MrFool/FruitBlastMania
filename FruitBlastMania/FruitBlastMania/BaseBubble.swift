/*
    BaseBubble is the base bubble class that all other bubbles (static or projectile) should inherit from. This is where
    we should add attributes whereby we want all bubbles to have.
*/

import Foundation

class BaseBubble: PhysicsBody {
    private var bubbleName: String = ""
    
    func setBubbleName(newName: String) {
        self.bubbleName = newName
    }
    
    func getBubbleName() -> String {
        return self.bubbleName
    }
}