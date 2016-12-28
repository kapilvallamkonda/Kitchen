//
//  GroceryDataStoreProtocol.swift
//  Groceries
//
//  Created by Kapil vallamkonda on 12/24/16.
//  Copyright © 2016 Kapil vallamkonda. All rights reserved.
//

import Foundation
protocol GroceryDataStoreProtocol {
    func getKitchenList() -> [GroceryItem]
}
