//
//  GroceryDataStore.swift
//  Groceries
//
//  Created by Kapil vallamkonda on 12/24/16.
//  Copyright © 2016 Kapil vallamkonda. All rights reserved.
//

import Foundation
class GroceryDataStore: GroceryDataStoreProtocol {
    func getKitchenList() -> [GroceryItem] {
        return [
            GroceryItem(groceryName: "Salt", iconURL: "",isAvailable: true),
            GroceryItem(groceryName: "Yogurt", iconURL: "", isAvailable: false),
            GroceryItem(groceryName: "Yogurt", iconURL: "", isAvailable: false)]
    }
}
