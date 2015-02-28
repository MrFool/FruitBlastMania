/*
    NumberUtilities is where we keep the utility functions for nfile manipulations
*/

import Foundation

class FileUtilities {
    
    // helper function for getting the documents path
    func documentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = paths[0] as String
        return documentDirectory
    }
}