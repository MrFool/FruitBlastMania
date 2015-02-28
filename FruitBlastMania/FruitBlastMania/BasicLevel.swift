/*
    BasicLevel is the level cruncher that can build up a collection of things such as "connections" between bubbles
    and / or the location of bubbles so that LevelStorage can pack / unpack it for the ADTs / view controllers
    in the future.
*/

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
    
    func buildLevelOne() {
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 1)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 1)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 1)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 3)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 3)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 3)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 3)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 3)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 3)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 6)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 6)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
    }
    
    func buildLevelTwo() {
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 0)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 0)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 0)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 0)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 0)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 1)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 3)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 3)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 5)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 5)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 5)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 5)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 5)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 6)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
    }

    func buildLevelThree() {
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 1)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 1)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 1)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 1)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 4)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 4)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 4)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 4)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 6)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 7)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 7)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 7)] = FruitBlastManiaConstants.bombBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 7)] = FruitBlastManiaConstants.bombBubbleName
    }
    
    func buildLevelFour() {
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 2)] = FruitBlastManiaConstants.starBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 2)] = FruitBlastManiaConstants.starBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 2)] = FruitBlastManiaConstants.starBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 2)] = FruitBlastManiaConstants.starBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 3)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 3)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 3)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 3)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 3)] = FruitBlastManiaConstants.lightningBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
    }
    
    func buildLevelFive() {
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 1)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 2)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 3)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 4)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 4)] = FruitBlastManiaConstants.starBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 5)] = FruitBlastManiaConstants.indestructibleBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 6)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 6)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 6)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 6)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 6)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 6)] = FruitBlastManiaConstants.indestructibleBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 6)] = FruitBlastManiaConstants.lightningBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 6)] = FruitBlastManiaConstants.bombBubbleName
        
        self.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        self.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 7)] = FruitBlastManiaConstants.indestructibleBubbleName
    }
    
    private func _checkRep() {
        // disabling checks to reduce latency
    }
}