/*
    GameEngine is the file that deals with calculations and helping to update the representation of the game
*/

import Foundation
import UIKit

class GameEngine {
    typealias N = Node<ColorBubble>
    typealias E = Edge<ColorBubble>
    
    var graphRepresentationOfGameState: Graph<ColorBubble> = Graph<ColorBubble>(isDirected: false)
    var currentLevel: BasicLevel?
    var numUtils = NumberUtilities()
    
    let rootNode = Node<ColorBubble>(ColorBubble(
        nameGiven: "rootNode",
        bodyCenter: CGPoint(x: 0, y: 0),
        anIndexPath: NSIndexPath(forRow: 0, inSection: 1000))
    )
    
    // for unit testing purposes, do not remove
    init(aLevel: BasicLevel) {
        currentLevel = aLevel
        
        graphRepresentationOfGameState.addNode(rootNode)
    }
    
    init(aLevel: BasicLevel, aCollectionView: UICollectionView) {
        currentLevel = aLevel
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = currentLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(
                nameGiven: dictionaryOfBubblesInStringFormat[key]!,
                bodyCenter: aCollectionView.cellForItemAtIndexPath(key)!.center,
                anIndexPath: key
            )
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        graphRepresentationOfGameState.addNode(rootNode)
        
        for key in dictionaryOfBubblesInColorBubbleFormat.keys {
            updateGraphByAddingNode(key, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
        }
    }
    
    // TODO refactor
    func updateGraphByAddingNode(anIndexPath: NSIndexPath, aDictionary: Dictionary<NSIndexPath, ColorBubble>) {
        let bubble = aDictionary[anIndexPath]
        let bubbleNode: N = Node<ColorBubble>(bubble!)
        
        graphRepresentationOfGameState.addNode(bubbleNode)
        
        if !numUtils.isOdd(anIndexPath.section) {
            let indexPathTopLeft = NSIndexPath(forRow: anIndexPath.row - 1, inSection: anIndexPath.section - 1)
            let indexPathTopRight = NSIndexPath(forRow: anIndexPath.row, inSection: anIndexPath.section - 1)
            let indexPathLeft = NSIndexPath(forRow: anIndexPath.row - 1, inSection: anIndexPath.section)
            let indexPathRight = NSIndexPath(forRow: anIndexPath.row + 1, inSection: anIndexPath.section)
            let indexPathBottomLeft = NSIndexPath(forRow: anIndexPath.row - 1, inSection: anIndexPath.section + 1)
            let indexPathBottomRight = NSIndexPath(forRow: anIndexPath.row, inSection: anIndexPath.section + 1)
            
            if anIndexPath.section == 0 {
                switch anIndexPath.row {
                case 0:
                    let edgeToRootNode = Edge<ColorBubble>(source: bubbleNode, destination: rootNode)
                    graphRepresentationOfGameState.addEdge(edgeToRootNode)
                    
                    if let rightBubble = aDictionary[indexPathRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomRightBubble = aDictionary[indexPathBottomRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                case 11:
                    let edgeToRootNode = Edge<ColorBubble>(source: bubbleNode, destination: rootNode)
                    graphRepresentationOfGameState.addEdge(edgeToRootNode)
                    
                    if let leftBubble = aDictionary[indexPathLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomLeftBubble = aDictionary[indexPathBottomLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                default:
                    let edgeToRootNode = Edge<ColorBubble>(source: bubbleNode, destination: rootNode)
                    graphRepresentationOfGameState.addEdge(edgeToRootNode)
                    
                    if let leftBubble = aDictionary[indexPathLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let rightBubble = aDictionary[indexPathRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomLeftBubble = aDictionary[indexPathBottomLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomRightBubble = aDictionary[indexPathBottomRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                }
            } else if anIndexPath.section == 8 {
                switch anIndexPath.row {
                case 0:
                    if let topRightBubble = aDictionary[indexPathTopRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let rightBubble = aDictionary[indexPathRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                case 11:
                    if let topLeftBubble = aDictionary[indexPathTopLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let leftBubble = aDictionary[indexPathLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                default:
                    if let topLeftBubble = aDictionary[indexPathTopLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let topRightBubble = aDictionary[indexPathTopRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let leftBubble = aDictionary[indexPathLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let rightBubble = aDictionary[indexPathRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                }
            } else {
                switch anIndexPath.row {
                case 0:
                    if let topRightBubble = aDictionary[indexPathTopRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let rightBubble = aDictionary[indexPathRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomRightBubble = aDictionary[indexPathBottomRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                case 11:
                    if let topLeftBubble = aDictionary[indexPathTopLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let leftBubble = aDictionary[indexPathLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomLeftBubble = aDictionary[indexPathBottomLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                default:
                    if let topLeftBubble = aDictionary[indexPathTopLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let topRightBubble = aDictionary[indexPathTopRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let leftBubble = aDictionary[indexPathLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let rightBubble = aDictionary[indexPathRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomLeftBubble = aDictionary[indexPathBottomLeft] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomLeftBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                    
                    if let bottomRightBubble = aDictionary[indexPathBottomRight] {
                        let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomRightBubble))
                        graphRepresentationOfGameState.addEdge(edgeToThatNode)
                    }
                }
            }
        } else {
            let indexPathTopLeft = NSIndexPath(forRow: anIndexPath.row, inSection: anIndexPath.section - 1)
            let indexPathTopRight = NSIndexPath(forRow: anIndexPath.row + 1, inSection: anIndexPath.section - 1)
            let indexPathLeft = NSIndexPath(forRow: anIndexPath.row - 1, inSection: anIndexPath.section)
            let indexPathRight = NSIndexPath(forRow: anIndexPath.row + 1, inSection: anIndexPath.section)
            let indexPathBottomLeft = NSIndexPath(forRow: anIndexPath.row, inSection: anIndexPath.section + 1)
            let indexPathBottomRight = NSIndexPath(forRow: anIndexPath.row + 1, inSection: anIndexPath.section + 1)
            
            switch anIndexPath.row {
            case 0:
                if let topLeftBubble = aDictionary[indexPathTopLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topLeftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let topRightBubble = aDictionary[indexPathTopRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topRightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let rightBubble = aDictionary[indexPathRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let bottomLeftBubble = aDictionary[indexPathBottomLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomLeftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let bottomRightBubble = aDictionary[indexPathBottomRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomRightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
            case 10:
                if let topLeftBubble = aDictionary[indexPathTopLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topLeftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let topRightBubble = aDictionary[indexPathTopRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topRightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let leftBubble = aDictionary[indexPathLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let bottomLeftBubble = aDictionary[indexPathBottomLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomLeftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let bottomRightBubble = aDictionary[indexPathBottomRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomRightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
            default:
                if let topLeftBubble = aDictionary[indexPathTopLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topLeftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let topRightBubble = aDictionary[indexPathTopRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(topRightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let leftBubble = aDictionary[indexPathLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(leftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let rightBubble = aDictionary[indexPathRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(rightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let bottomLeftBubble = aDictionary[indexPathBottomLeft] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomLeftBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
                
                if let bottomRightBubble = aDictionary[indexPathBottomRight] {
                    let edgeToThatNode = Edge<ColorBubble>(source:bubbleNode, destination: Node<ColorBubble>(bottomRightBubble))
                    graphRepresentationOfGameState.addEdge(edgeToThatNode)
                }
            }
        }
    }
    // TODO refactor
    
    func bubblesToPopAfterSnapping(snappedBubble: ColorBubble) -> [NSIndexPath] {
        var arrayToReturn = [NSIndexPath]()
        var arrayOfBubblesToRemove = [ColorBubble]()
        var dictionaryOfVisitedBubbles: Dictionary<NSIndexPath, Bool> = Dictionary<NSIndexPath, Bool>()
        
        arrayOfBubblesToRemove.append(snappedBubble)
        dictionaryOfVisitedBubbles[snappedBubble.indexPath] = true
        
        let snappedBubbleNode = Node<ColorBubble>(snappedBubble)
        let snappedBubbleColor = snappedBubble.getBubbleName()
        
        var queueOfNodesToVisit: Queue<N> = Queue<Node<ColorBubble>>()
        
        let adjacentNodesToSnappedBubbleNode = graphRepresentationOfGameState.adjacentNodesFromNode(snappedBubbleNode)
        
        for node in adjacentNodesToSnappedBubbleNode {
            if  node.getLabel().getBubbleName() == snappedBubbleColor {
                queueOfNodesToVisit.enqueue(node)
                
                arrayOfBubblesToRemove.append(node.getLabel())
                dictionaryOfVisitedBubbles[node.getLabel().indexPath] = true
            }
        }
        
        while !queueOfNodesToVisit.isEmpty {
            let nodeToVisit = queueOfNodesToVisit.dequeue()!
            
            let adjacentNodesToNodeToVisit = graphRepresentationOfGameState.adjacentNodesFromNode(nodeToVisit)
            
            for node in adjacentNodesToNodeToVisit {
                if dictionaryOfVisitedBubbles[node.getLabel().indexPath] != true &&
                    node.getLabel().getBubbleName() == snappedBubbleColor {
                    queueOfNodesToVisit.enqueue(node)
                    
                    arrayOfBubblesToRemove.append(node.getLabel())
                    dictionaryOfVisitedBubbles[node.getLabel().indexPath] = true
                }
            }
        }
        
        if arrayOfBubblesToRemove.count >= FruitBlastManiaConstants.numberOfBubblesConnectedBeforeBursting {
            for bubble in arrayOfBubblesToRemove {
                arrayToReturn.append(bubble.indexPath)
            }
        }
        
        if arrayToReturn.count != 0 {
            for bubble in arrayOfBubblesToRemove {
                let bubbleNode: N = Node<ColorBubble>(bubble)
                
                let adjacentNodes: [N] = graphRepresentationOfGameState.adjacentNodesFromNode(bubbleNode)
                
                for node in adjacentNodes {
                    let edgeToRemove: E = Edge<ColorBubble>(source: bubbleNode, destination: node)
                    
                    graphRepresentationOfGameState.removeEdge(edgeToRemove)
                    graphRepresentationOfGameState.removeNode(bubbleNode)
                }
                
                self.currentLevel!.collectionOfBubbles[bubble.indexPath] = nil
            }
        }
        
        return arrayToReturn
    }
    
    func unattachedBubbles() -> [NSIndexPath] {
        var arrayToReturn = [NSIndexPath]()
        var arrayOfBubblesToNotRemove = [ColorBubble]()
        var dictionaryOfVisitedBubbles: Dictionary<NSIndexPath, Bool> = Dictionary<NSIndexPath, Bool>()
        
        arrayOfBubblesToNotRemove.append(rootNode.getLabel())
        dictionaryOfVisitedBubbles[rootNode.getLabel().indexPath] = true
        
        var queueOfNodesToVisit: Queue<N> = Queue<Node<ColorBubble>>()
        
        let adjacentNodesToRootBubbleNode = graphRepresentationOfGameState.adjacentNodesFromNode(rootNode)
        
        for node in adjacentNodesToRootBubbleNode {
            queueOfNodesToVisit.enqueue(node)
            
            arrayOfBubblesToNotRemove.append(node.getLabel())
            dictionaryOfVisitedBubbles[node.getLabel().indexPath] = true
        }
        
        while !queueOfNodesToVisit.isEmpty {
            let nodeToVisit = queueOfNodesToVisit.dequeue()!
            
            let adjacentNodesToNodeToVisit = graphRepresentationOfGameState.adjacentNodesFromNode(nodeToVisit)
            
            for node in adjacentNodesToNodeToVisit {
                if dictionaryOfVisitedBubbles[node.getLabel().indexPath] != true {
                    queueOfNodesToVisit.enqueue(node)
                    
                    arrayOfBubblesToNotRemove.append(node.getLabel())
                    dictionaryOfVisitedBubbles[node.getLabel().indexPath] = true
                }
            }
        }
        
        for key in currentLevel!.collectionOfBubbles.keys {
            dictionaryOfVisitedBubbles[key] = true
        }
        
        for bubble in arrayOfBubblesToNotRemove {
            dictionaryOfVisitedBubbles[bubble.indexPath] = false
        }
        
        for key in dictionaryOfVisitedBubbles.keys {
            if dictionaryOfVisitedBubbles[key] == true {
                arrayToReturn.append(key)
            }
        }
        
        let allNodes = graphRepresentationOfGameState.nodes
        
        if arrayToReturn.count != 0 {
            for node in allNodes {
                let bubble: ColorBubble = node.getLabel()
                
                if dictionaryOfVisitedBubbles[bubble.indexPath] == true {
                    let bubbleNode: N = Node<ColorBubble>(bubble)
                    
                    let adjacentNodes: [N] = graphRepresentationOfGameState.adjacentNodesFromNode(bubbleNode)
                    
                    for node in adjacentNodes {
                        let edgeToRemove: E = Edge<ColorBubble>(source: bubbleNode, destination: node)
                        
                        graphRepresentationOfGameState.removeEdge(edgeToRemove)
                        graphRepresentationOfGameState.removeNode(bubbleNode)
                    }
                    
                    self.currentLevel!.collectionOfBubbles[bubble.indexPath] = nil
                }
            }
        }
        
        return arrayToReturn
    }
    
    func bubbleSnapped(snappedBubble: ColorBubble, aCollectionView: UICollectionView) {
        self.currentLevel!.collectionOfBubbles[snappedBubble.indexPath] = snappedBubble.getBubbleName()
        
        let dictionaryOfBubblesInStringFormat: Dictionary<NSIndexPath, String> = currentLevel!.collectionOfBubbles
        
        var dictionaryOfBubblesInColorBubbleFormat: Dictionary<NSIndexPath, ColorBubble> = Dictionary<NSIndexPath, ColorBubble>()
        
        for key in dictionaryOfBubblesInStringFormat.keys {
            let bubbleConstructed = ColorBubble(
                nameGiven: dictionaryOfBubblesInStringFormat[key]!,
                bodyCenter: aCollectionView.cellForItemAtIndexPath(key)!.center,
                anIndexPath: key
            )
            
            dictionaryOfBubblesInColorBubbleFormat[key] = bubbleConstructed
        }
        
        updateGraphByAddingNode(snappedBubble.indexPath, aDictionary: dictionaryOfBubblesInColorBubbleFormat)
    }
    
    func isCollided(movingBubble: ProjectileBubble, staticBubblePoint: CGPoint) -> Bool {
        let movingBubbleCenterPointX = CGFloat(movingBubble.centerPoint!.x)
        let movingBubbleCenterPointY = CGFloat(movingBubble.centerPoint!.y)
        let staticBubbleCenterPointX = CGFloat(staticBubblePoint.x)
        let staticBubbleCenterPointY = CGFloat(staticBubblePoint.y)
        let dx = movingBubbleCenterPointX - staticBubbleCenterPointX
        let dy = movingBubbleCenterPointY - staticBubbleCenterPointY
        let radii = CGFloat(movingBubble.radius! + FruitBlastManiaConstants.bubbleRadius)
        
        if (dx * dx) + (dy * dy) < (radii * radii) {
            return true
        }
        
        return false
    }
    
    func didCollideWithLeftWall(movingBubble: ProjectileBubble) -> Bool {
        var projectileX: Int = Int(movingBubble.centerPoint!.x)
        
        return projectileX - FruitBlastManiaConstants.bubbleRadius <= FruitBlastManiaConstants.deviceLeftBarrier
    }
    
    func didCollideWithRightWall(movingBubble: ProjectileBubble) -> Bool {
        var projectileX: Int = Int(movingBubble.centerPoint!.x)
        
        return projectileX + FruitBlastManiaConstants.bubbleRadius >= FruitBlastManiaConstants.deviceRightBarrier
    }
    
    func didCollideWithTopWall(movingBubble: ProjectileBubble) -> Bool {
        var projectileY: Int = Int(movingBubble.centerPoint!.y)
        
        return projectileY - FruitBlastManiaConstants.bubbleRadius <= FruitBlastManiaConstants.deviceTopBarrier
    }
    
    // TODO refactor
    func assignVelocityToProjectile(tappedPoint: CGPoint) -> (Float, Float) {
        let tappedPointX = tappedPoint.x
        let tappedPointY = tappedPoint.y
        
        let deviceCenterPointX: CGFloat = CGFloat(FruitBlastManiaConstants.deviceCenterPointX)
        
        var shootLeft: Bool
        var triangleX: CGFloat
        var triangleY: CGFloat
        
        if tappedPointX > deviceCenterPointX {
            triangleX = tappedPointX - deviceCenterPointX
            shootLeft = false
        } else {
            triangleX = deviceCenterPointX - tappedPointX
            shootLeft = true
        }
        
        triangleY = (CGFloat(FruitBlastManiaConstants.deviceHeight) - tappedPointY) - CGFloat(FruitBlastManiaConstants.bubbleRadius)
        
        let angle = atan(triangleX / triangleY)
        
        let speedInXDirection = Float(sin(angle)) * FruitBlastManiaConstants.projectileVelocity
        let speedInYDirection = Float(cos(angle)) * FruitBlastManiaConstants.projectileVelocity
        
        if shootLeft {
            return (-speedInXDirection, speedInYDirection)
        } else {
            return (speedInXDirection, speedInYDirection)
        }
    }
    // TODO refactor
    
    func generateBubbleToBeShotName() -> String {
        var existingBubblesChecker: Dictionary<String, Bool> = Dictionary<String, Bool>()
        
        existingBubblesChecker[FruitBlastManiaConstants.redBubbleName] = false
        existingBubblesChecker[FruitBlastManiaConstants.orangeBubbleName] = false
        existingBubblesChecker[FruitBlastManiaConstants.greenBubbleName] = false
        existingBubblesChecker[FruitBlastManiaConstants.blueBubbleName] = false
        
        let allNodes = graphRepresentationOfGameState.nodes
        
        for node in allNodes {
            let bubbleName: String = node.getLabel().getBubbleName()
            
            if existingBubblesChecker[bubbleName] == nil {
                // do nothing, this is a special bubble, open for changes in the future if we allow
                // for shooting of special bubbles but for now there's no need to care about this case
            } else {
                if existingBubblesChecker[bubbleName] == false {
                    existingBubblesChecker[bubbleName] = true
                }
            }
        }
        
        var randomRollerArray: [String] = [String]()
        
        for key in existingBubblesChecker.keys {
            if existingBubblesChecker[key] == true {
                randomRollerArray.append(key)
            }
        }
        
        let randomNumber = Int(arc4random_uniform(UInt32(randomRollerArray.count)))
        
        if randomRollerArray.count == 0 {
            return FruitBlastManiaConstants.redBubbleName
            // realistically should return a random of any of the bubble because by now
            // any kind of bubble should allow the user to finish the game, or of course cannot
            // finish if the design of the level is bad
        }
        
        return randomRollerArray[randomNumber]
    }
}