/*
    FileUtilities is where we keep the utility functions for generating bubbles for the rest of the app
    to reduce code repetition
*/

import Foundation
import UIKit

class BubbleFactory {
    
    func createBubble(bubbleName: String) -> String {
        var bubbleFileNameToReturn: String?
        
        switch bubbleName {
        case FruitBlastManiaConstants.redBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.redBubbleFileName
        case FruitBlastManiaConstants.orangeBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.orangeBubbleFileName
        case FruitBlastManiaConstants.greenBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.greenBubbleFileName
        case FruitBlastManiaConstants.blueBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.blueBubbleFileName
        default:
            break
        }
        
        return bubbleFileNameToReturn!
    }
    
    func createBubble(bubbleName: String, aPoint: CGPoint, anIndexPath: NSIndexPath) -> (String, ColorBubble) {
        var bubbleFileNameToReturn: String?
        var colorBubbleToReturn: ColorBubble?
        
        switch bubbleName {
        case FruitBlastManiaConstants.redBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.redBubbleFileName
            colorBubbleToReturn = ColorBubble(
                nameGiven: FruitBlastManiaConstants.redBubbleName,
                bodyCenter: aPoint,
                anIndexPath: anIndexPath
            )
        case FruitBlastManiaConstants.orangeBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.orangeBubbleFileName
            colorBubbleToReturn = ColorBubble(
                nameGiven: FruitBlastManiaConstants.orangeBubbleName,
                bodyCenter: aPoint,
                anIndexPath: anIndexPath
            )
        case FruitBlastManiaConstants.greenBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.greenBubbleFileName
            colorBubbleToReturn = ColorBubble(
                nameGiven: FruitBlastManiaConstants.greenBubbleName,
                bodyCenter: aPoint,
                anIndexPath: anIndexPath
            )
        case FruitBlastManiaConstants.blueBubbleName:
            bubbleFileNameToReturn = FruitBlastManiaConstants.blueBubbleFileName
            colorBubbleToReturn = ColorBubble(
                nameGiven: FruitBlastManiaConstants.blueBubbleName,
                bodyCenter: aPoint,
                anIndexPath: anIndexPath
            )
        default:
            break
        }
        
        return (bubbleFileNameToReturn!, colorBubbleToReturn!)
    }
}