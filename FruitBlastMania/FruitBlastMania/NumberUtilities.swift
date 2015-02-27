/*
    NumberUtilities is where we keep the utility functions for numbers
*/

import Foundation
import UIKit

class NumberUtilities {
    func isOdd(aNumber: Int) -> Bool {
        return !(aNumber % 2 == 0)
    }
}