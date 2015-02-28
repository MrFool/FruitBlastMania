/*
    FuitBlastManiaConstants is where constants that are used in multiple files (or possibly in multiple files in the future)
    are stored!
*/

import Foundation
import UIKit

struct FruitBlastManiaConstants {
    // View Controllers titles
    static let mainViewControllerTitle: String = "mainViewController"
    static let shooterViewControllerTitle: String = "shooterViewController"
    static let gridViewControllerTitle: String = "gridViewController"
    
    // Device constants
    static let screenSize: CGRect = UIScreen.mainScreen().bounds
    static let deviceWidth: Int = Int(screenSize.width)
    static let deviceHeight: Int = Int(screenSize.height)
    static let deviceCenterPointX: Int = deviceWidth / 2
    static let deviceLeftBarrier: Int = 0
    static let deviceRightBarrier: Int = deviceWidth
    static let deviceTopBarrier: Int = 0
    static let deviceBottomBarrier: Int = deviceHeight
    
    // BubblePhysics design constants
    static let maxNumberOfBubblesPerRow: Int = 12
    static let transparentAlpha: CGFloat = 0.0
    
    // BubblePhysics timer constants
    static let refreshTimer60fps: Double = 1.0 / 60
    
    // Image file constants
    static let blueBubbleFileName: String = "bubble-blue"
    static let redBubbleFileName: String = "bubble-red"
    static let orangeBubbleFileName: String = "bubble-orange"
    static let greenBubbleFileName: String = "bubble-green"
    static let indestructibleBubbleFileName: String = "bubble-indestructible"
    static let lightningBubbleFileName: String = "bubble-lightning"
    static let bombBubbleFileName: String = "bubble-bomb"
    static let starBubbleFileName: String = "bubble-star"
    static let eraserFileName: String = "eraser-1"
    
    // Bubble Object constants
    static let bubbleWidth: CGFloat = CGFloat(deviceWidth / maxNumberOfBubblesPerRow)
    static let bubbleHeight: CGFloat = bubbleWidth
    static let bubbleRadius: Int = Int(bubbleWidth / 2)
    static let selectedBubbleAlpha: CGFloat = 1.0
    static let notSelectedBubbleAlpha: CGFloat = 0.7
    static let unfilledBubbleColor: UIColor = UIColor(red: 0.5, green: 128/255.0, blue: 0.5, alpha: 0.35)
    static let unfilledBubbleBorderWidth: CGFloat = 2.0
    static let shotBubbleTag: Int = 1
    static let expansionRadius: CGFloat = bubbleWidth / 16
    
    // Projectile constants
    static let projectileVelocity: Float = Float(15)
    static let projectileInitialStartPoint: CGPoint = CGPoint(x: deviceWidth / 2, y: deviceHeight - (Int(bubbleHeight) / 2))
    
    // Bubble shorthand names
    static let blueBubbleName: String = "blue"
    static let redBubbleName: String = "red"
    static let orangeBubbleName: String = "orange"
    static let greenBubbleName: String = "green"
    static let indestructibleBubbleName: String = "indestructible"
    static let lightningBubbleName: String = "lightning"
    static let bombBubbleName: String = "bomb"
    static let starBubbleName: String = "star"
    
    // Grid Object constants -- note that section starts from 0
    static let basicGridNumberOfSection: Int = 9
    static let basicGridEvenRowNumberOfBubbles: Int = maxNumberOfBubblesPerRow
    static let basicGridOddRowNumberOfBubbles: Int = basicGridEvenRowNumberOfBubbles - 1
    
    // Bubble Cycling constants
    // TODO change into an array and use an index to keep track.

    static let cyclingDictionary = [
        "afterred": orangeBubbleName,
        "afterorange": greenBubbleName,
        "aftergreen": blueBubbleName,
        "afterblue": indestructibleBubbleName,
        "afterindestructible": lightningBubbleName,
        "afterlightning": bombBubbleName,
        "afterbomb": starBubbleName,
        "afterstar": redBubbleName,
        "redBubbleFileName": redBubbleFileName,
        "orangeBubbleFileName": orangeBubbleFileName,
        "greenBubbleFileName": greenBubbleFileName,
        "blueBubbleFileName": blueBubbleFileName,
        "indestructibleBubbleFileName": indestructibleBubbleFileName,
        "lightningBubbleFileName": lightningBubbleFileName,
        "bombBubbleFileName": bombBubbleFileName,
        "starBubbleFileName": starBubbleFileName
    ]
    
    // Random roller array
    static let randomRollerArray: [String] = [blueBubbleName, redBubbleName, orangeBubbleName, greenBubbleName]
    
    // Number of bubbles to randomise amongst
    static let numberOfStaticBubbles: UInt32 = UInt32(randomRollerArray.count)
    
    // File Type constants
    static let levelExtension: String = ".level"
    
    // Number of bubbles connected for bursting
    static let numberOfBubblesConnectedBeforeBursting: Int = 3
}