//
//  GroceryItem.swift
//  Groceries
//
//  Created by Kapil vallamkonda on 12/24/16.
//  Copyright © 2016 Kapil vallamkonda. All rights reserved.
//

import Foundation
class GroceryItem: NSObject {
    var groceryName: String
    var iconURL: String
    var isAvailable: Bool
    init(groceryName: String, iconURL: String,isAvailable: Bool) {
        self.groceryName = groceryName
        self.iconURL = iconURL
        self.isAvailable = isAvailable
    }
}
