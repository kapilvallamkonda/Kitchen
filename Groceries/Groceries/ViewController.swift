//
//  ViewController.swift
//  Groceries
//
//  Created by Kapil vallamkonda on 12/24/16.
//  Copyright © 2016 Kapil vallamkonda. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tablewView: UITableView!
    var ref: FIRDatabaseReference!
    var sections: [GroceryItem] = []
    var selectedItem: GroceryItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sections = GroceryDataStore().getKitchenList()
        self.tablewView.separatorStyle = UITableViewCellSeparatorStyle.none
        // Do any additional setup after loading the view, typically from a nib.

        ref = FIRDatabase.database().reference()
        if let userID = FIRAuth.auth()?.currentUser?.uid {
        
        ref.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let username = value?["username"] as? String ?? ""
//            let user = User.init(username: username)
//            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let updateVC = segue.destination as? UpdateViewController {
            if let selectedItem = self.selectedItem {
                updateVC.item = selectedItem
            }
        }
        
    }
    
    //Table View Delegate methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tablewView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "itemCell")
        }
        let nameLabel: UILabel = cell!.viewWithTag(1) as! UILabel
        let availabilityImage: UIImageView = cell!.viewWithTag(2) as! UIImageView
        
        nameLabel.text = sections[indexPath.row].groceryName
        let isAvailable: Bool = sections[indexPath.row].isAvailable
        if isAvailable{
            availabilityImage.image = UIImage(named: "available")
        }else{
            availabilityImage.image = UIImage(named: "unavailable")
        }
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedItem = sections[indexPath.row]
        if let popVC = self.storyboard?.instantiateViewController(withIdentifier: "popVC") as? UpdateViewController {
             popVC.item = self.selectedItem
             self.navigationController?.pushViewController(popVC, animated: true)
        }        
    }
}

