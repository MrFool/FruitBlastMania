/*
    FileUtilities is where we keep the utility functions for file manipulations
*/

import Foundation

class FileUtilities {
    
    // helper function for getting the documents path, used for saving / loading
    func documentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = paths[0] as String
        return documentDirectory
    }
}