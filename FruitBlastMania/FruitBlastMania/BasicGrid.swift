/*
    BasicGrid is the basic 9 section grid that is the default grid that levels should be designed with.
*/

import Foundation

class BasicGrid: BaseGrid {
    let numberOfSections: Int = FruitBlastManiaConstants.basicGridNumberOfSection
    let numberOfBubblesOnOddRows: Int = FruitBlastManiaConstants.basicGridOddRowNumberOfBubbles
    let numberOfBubblesOnEvenRows: Int = FruitBlastManiaConstants.basicGridEvenRowNumberOfBubbles
}