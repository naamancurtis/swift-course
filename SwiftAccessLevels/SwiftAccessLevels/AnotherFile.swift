//
//  AnotherFile.swift
//  SwiftAccessLevels
//
//  Created by Angela Yu on 14/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class AnotherClassInAnotherFile {
    
    init() {
        let a = AClass()
        //Step 8. Try to print aFilePrivateProperty Here - Not POssible
       
        //Step 10. Try to print anInternalProperty Here
        print("\(a.anInternalProperty) printed from another file")
    }
    
}
