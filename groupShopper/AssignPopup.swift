//
//  AssignPopup.swift
//  groupShopper
//
//  Created by James Boudouris on 8/5/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class AssignPopup: UIAlertController, UITableViewDelegate, UITableViewDataSource {
    
    let alrController = UIAlertController(title: "Select Group Members", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
    
    let tableView = UITableView(frame: CGRect())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "assign"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.black
        alrController.view.addSubview(tableView)
        
        alrController.addAction(UIAlertAction(title: "add", style: .default, handler: nil))
        alrController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList[currentGroup].members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        cell.textLabel?.text = groupList[currentGroup].members[indexPath.row].name
        return cell
    }
    
    
    
}
