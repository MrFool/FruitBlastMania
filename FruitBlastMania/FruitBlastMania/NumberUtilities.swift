/*
    NumberUtilities is where we keep the utility functions for numbers
*/

import Foundation

class NumberUtilities {
    
    // helper function for checking whether a number is odd
    func isOdd(aNumber: Int) -> Bool {
        return !(aNumber % 2 == 0)
    }
}