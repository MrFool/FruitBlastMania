/*
    The GameEngine tests
*/

import UIKit
import XCTest

class BubblePhysicsTests: XCTestCase {
    var testingGameEngine: GameEngine?
    var aLevel: BasicLevel?
    
    let rootNode = Node<ColorBubble>(ColorBubble(nameGiven: "rootNode", bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 0, inSection: 1000)))
    
    override func setUp() {
        super.setUp()
        
        aLevel = BasicLevel()
        
        testingGameEngine = GameEngine(aLevel: aLevel!)
    }
    
    override func tearDown() {
        aLevel = nil
        
        testingGameEngine = nil
        
        super.tearDown()
    }
    
    func testAddNoNodeButShouldHaveRootNode() {
        XCTAssert(testingGameEngine!.graphRepresentationOfGameState.nodes.count == 1, "Graph that was just initialised did not have only 1 node!")
        
        let nodeThatShouldBeRootNodeAndTheOnlyNode = testingGameEngine!.graphRepresentationOfGameState.nodes[0]
        
        XCTAssert(nodeThatShouldBeRootNodeAndTheOnlyNode == rootNode, "Graph that was just initialised does not have the root node!")
    }
    
    func testAddOneNode() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        let colorBubbleConstructued = ColorBubble(nameGiven: FruitBlastManiaConstants.blueBubbleName, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        let nodeConstructed = Node<ColorBubble>(colorBubbleConstructued)
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let nodeToCheck = testingGameEngine!.graphRepresentationOfGameState.nodes[1]
        
        XCTAssert(testingGameEngine!.graphRepresentationOfGameState.nodes.count == 2, "Graph after adding one node did not have only 2 nodes!")
        XCTAssert(nodeToCheck == nodeConstructed, "Graph after adding one node did not match node that is expected!")
    }
    
    func testAddFewNodes() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        let colorBubbleConstructued1 = ColorBubble(nameGiven: FruitBlastManiaConstants.blueBubbleName, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        let nodeConstructed1 = Node<ColorBubble>(colorBubbleConstructued1)
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        let colorBubbleConstructued2 = ColorBubble(nameGiven: FruitBlastManiaConstants.blueBubbleName, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 1, inSection: 0))
        let nodeConstructed2 = Node<ColorBubble>(colorBubbleConstructued2)
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        let colorBubbleConstructued3 = ColorBubble(nameGiven: FruitBlastManiaConstants.blueBubbleName, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 2, inSection: 0))
        let nodeConstructed3 = Node<ColorBubble>(colorBubbleConstructued3)
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let nodeToCheck1 = testingGameEngine!.graphRepresentationOfGameState.nodes[1]
        let nodeToCheck2 = testingGameEngine!.graphRepresentationOfGameState.nodes[2]
        let nodeToCheck3 = testingGameEngine!.graphRepresentationOfGameState.nodes[3]
        
        XCTAssert(testingGameEngine!.graphRepresentationOfGameState.nodes.count == 4, "Graph after adding one node did not have only 2 nodes!")
        XCTAssert(nodeToCheck2 == nodeConstructed1, "Graph after adding nodes did not match node that is expected!")
        XCTAssert(nodeToCheck1 == nodeConstructed2, "Graph after adding nodes did not match node that is expected!")
        XCTAssert(nodeToCheck3 == nodeConstructed3, "Graph after adding nodes did not match node that is expected!")
    }
    
    func testEmptyNoColorBubbleShouldPop() {
        XCTAssert(testingGameEngine!.graphRepresentationOfGameState.nodes.count == 1, "Graph that was just initialised did not have only 1 node!")
        
        let arrayOfBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.bubblesToPopAfterSnapping(rootNode.getLabel())
        
        XCTAssert(arrayOfBubblesIndexPathToPop.count == 0, "Empty game state with only the root node oddly has color bubbles that should be popped!")
    }
    
    func testNonEmptyButNoColorBubbleShouldPop() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.redBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 3, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        let colorBubbleConstructued = ColorBubble(nameGiven: FruitBlastManiaConstants.blueBubbleName, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 3, inSection: 0))
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let arrayOfBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.bubblesToPopAfterSnapping(colorBubbleConstructued)
        
        XCTAssert(arrayOfBubblesIndexPathToPop.count == 0, "Game state without 3 connecting same color bubbles oddly has color bubbles that should be popped!")
    }
    
    func testThreeColorBubblePopping() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        let colorBubbleConstructued = ColorBubble(nameGiven: FruitBlastManiaConstants.blueBubbleName, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: NSIndexPath(forRow: 2, inSection: 0))
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let arrayOfBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.bubblesToPopAfterSnapping(colorBubbleConstructued)
        
        XCTAssert(arrayOfBubblesIndexPathToPop.count == 3, "Game state with 3 connecting same color bubbles oddly has NO color bubbles that should be popped!")
    }
    
    func testEmptyNoUnattachedBubbles() {
        XCTAssert(testingGameEngine!.graphRepresentationOfGameState.nodes.count == 1, "Graph that was just initialised did not have only 1 node!")
        
        let arrayOfUnattachedBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.unattachedBubbles()
        
        XCTAssert(arrayOfUnattachedBubblesIndexPathToPop.count == 0, "Empty game state with only the root node oddly has color bubbles that is unattached!")
    }
    
    func testNonEmptyButNoUnattachedBubbles() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 1, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 0)] = FruitBlastManiaConstants.blueBubbleName
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let arrayOfUnattachedBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.unattachedBubbles()
        
        XCTAssert(arrayOfUnattachedBubblesIndexPathToPop.count == 0, "Game State with no unattached bubbles oddly has color bubbles that is unattached!")
    }
    
    func testFewUnattachedAndShouldPop() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let arrayOfUnattachedBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.unattachedBubbles()
        
        XCTAssert(arrayOfUnattachedBubblesIndexPathToPop.count == 3, "Game State with 3 unattached bubbles oddly has NO color bubbles that is unattached!")
    }
    
    func testExplosion() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let arrayOfUnattachedBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.unattachedBubbles()
        
        XCTAssert(arrayOfUnattachedBubblesIndexPathToPop.count == 3, "Game State with 3 unattached bubbles oddly has NO color bubbles that is unattached!")
    }
    
    func testLightning() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let arrayOfUnattachedBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.unattachedBubbles()
        
        XCTAssert(arrayOfUnattachedBubblesIndexPathToPop.count == 3, "Game State with 3 unattached bubbles oddly has NO color bubbles that is unattached!")
    }
    
    func testStar() {
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 0, inSection: 3)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 6, inSection: 7)] = FruitBlastManiaConstants.blueBubbleName
        
        aLevel!.collectionOfBubbles[NSIndexPath(forRow: 2, inSection: 4)] = FruitBlastManiaConstants.blueBubbleName
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = aLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(nameGiven: dictionaryOfBubblesInStringFormat[key]!, bodyCenter: CGPoint(x: 0, y: 0), anIndexPath: key)
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            testingGameEngine!.updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
        
        let arrayOfUnattachedBubblesIndexPathToPop: [NSIndexPath] = testingGameEngine!.unattachedBubbles()
        
        XCTAssert(arrayOfUnattachedBubblesIndexPathToPop.count == 3, "Game State with 3 unattached bubbles oddly has NO color bubbles that is unattached!")
    }
    
    // MARK: test examples
    
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
}