//
//  Item.swift
//  Todoey
//
//  Created by Naaman Curtis on 12/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    
    // Relationships
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
