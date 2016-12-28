//
//  PopViewController.swift
//  Groceries
//
//  Created by Kapil vallamkonda on 12/28/16.
//  Copyright © 2016 Kapil vallamkonda. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    var item: GroceryItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Update"
        if let item = self.item {
            print(item.groceryName)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
