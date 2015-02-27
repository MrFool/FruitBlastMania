/*
    BasicLevel is the level cruncher that can build up a collection of things such as "connections" between bubbles
    and / or the location of bubbles so that LevelStorage can pack / unpack it for the ADTs / view controllers
    in the future.
*/

import UIKit
import Foundation

class BasicLevel: NSObject, NSCoding {
    var collectionOfBubbles: Dictionary<NSIndexPath, String> = Dictionary<NSIndexPath, String>()
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.collectionOfBubbles = decoder.decodeObjectForKey("bubbleNames") as Dictionary<NSIndexPath, String>
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.collectionOfBubbles, forKey: "bubbleNames")
    }
    
    func buildTestLevel() {
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
    }
    
    func buildLevelOne() {
        // do nothing for now, packaged level 1
    }
    
    func buildLevelTwo() {
        // do nothing for now, packaged level 2
    }

    func buildLevelThree() {
        // do nothing for now, packaged level 3
    }
    
    func buildLevelFour() {
        // do nothing for now, packaged level 4
    }
    
    func buildLevelFive() {
        // do nothing for now, packaged level 5
    }
    
    private func _checkRep() {
        // disabling checks to reduce latency
    }
}