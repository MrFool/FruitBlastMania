/*
    LevelSavingLoadingTests is where we add unit tests that we can do for saving/loading. 
    Refer to answers.txt for tests that can't be done using unit tests and 
    that has to be done through the UI itself.
*/

import UIKit
import XCTest

class LevelSavingLoadingTests: XCTestCase {
    var fileUtils = FileUtilities()
    
    // Mark: test for ColorBubble Model
    
    func testColorBubbleCreationPlusGetAndSet() {
        var testColorBubble = ColorBubble(nameGiven: FruitBlastManiaConstants.redBubbleName,
            bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        
        assert(testColorBubble.getBubbleName() == FruitBlastManiaConstants.redBubbleName,
            "The creation of a color bubble was not done right!")
        
        testColorBubble.setBubbleName(FruitBlastManiaConstants.blueBubbleName)
        
        assert(testColorBubble.getBubbleName() == FruitBlastManiaConstants.blueBubbleName,
            "The getting of the name of a color bubble was not done right!")
    }
    
    // Mark: test for BasicLevel saving and loading
    
    func testBasicLevelArchiving() {
        var basicLevel: BasicLevel = BasicLevel()
        var filePath = fileUtils.documentsDirectory().stringByAppendingPathComponent("testingEmptyBasicLevel" +
            FruitBlastManiaConstants.levelExtension)
        
        NSKeyedArchiver.archiveRootObject([basicLevel], toFile: filePath)
        
        var unarchivedLevel: [BasicLevel] = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as [BasicLevel]
        var levelToLookAt: BasicLevel = unarchivedLevel[0]
        
        assert(basicLevel.collectionOfBubbles == levelToLookAt.collectionOfBubbles,
            "The encoding and decoding of an empty basic level was not done right!")
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        
        filePath = fileUtils.documentsDirectory().stringByAppendingPathComponent("testingOneCellBasicLevel" +
            FruitBlastManiaConstants.levelExtension)
        
        NSKeyedArchiver.archiveRootObject([basicLevel], toFile: filePath)
        
        unarchivedLevel = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as [BasicLevel]
        levelToLookAt = unarchivedLevel[0]
        
        assert(basicLevel.collectionOfBubbles == levelToLookAt.collectionOfBubbles,
            "The encoding and decoding of a single cell basic level was not done right!")
        
        filePath = fileUtils.documentsDirectory().stringByAppendingPathComponent("testingEmptyBasicLevel" +
            FruitBlastManiaConstants.levelExtension)
        
        NSKeyedArchiver.archiveRootObject([basicLevel], toFile: filePath)
        
        unarchivedLevel = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as [BasicLevel]
        levelToLookAt = unarchivedLevel[0]
        
        assert(basicLevel.collectionOfBubbles == levelToLookAt.collectionOfBubbles,
            "The overwriting basic level was not done right!")
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 0)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 1)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 1)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 1)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 1)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 1)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 1)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 2)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 2)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 2)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 2)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 3)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 3)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 3)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 3)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 3)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 3)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 3)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 4)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 4)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 5)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 5)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 5)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 5)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 6)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 6)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 6)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 6)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 6)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 7)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 7)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 8)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 8)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 8)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 8)] = FruitBlastManiaConstants.redBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 4, inSection: 8)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 5, inSection: 8)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 8)] = FruitBlastManiaConstants.orangeBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 7, inSection: 8)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 8, inSection: 8)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 9, inSection: 8)] = FruitBlastManiaConstants.greenBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 10, inSection: 8)] = FruitBlastManiaConstants.blueBubbleName
        basicLevel.collectionOfBubbles[NSIndexPath(forRow: 11, inSection: 8)] = FruitBlastManiaConstants.blueBubbleName
        
        filePath = fileUtils.documentsDirectory().stringByAppendingPathComponent("testingEmptyBasicLevel" +
            FruitBlastManiaConstants.levelExtension)
        
        NSKeyedArchiver.archiveRootObject([basicLevel], toFile: filePath)
        
        unarchivedLevel = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as [BasicLevel]
        levelToLookAt = unarchivedLevel[0]
        
        assert(basicLevel.collectionOfBubbles == levelToLookAt.collectionOfBubbles,
            "Saving of a full level and overwriting is not done right!")
    }
    
    // Mark: test examples
    
    func DISABLED_testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func DISABLED_testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}