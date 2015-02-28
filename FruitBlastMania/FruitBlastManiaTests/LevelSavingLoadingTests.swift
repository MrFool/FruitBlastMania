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