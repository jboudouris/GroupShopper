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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        tableView.setEditing(true, animated: true)
//        tableView.allowsSelectionDuringEditing = true
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.reloadData()
        self.present(alrController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Testing\n\n\n\n\n\n\n\n"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.white
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        alrController.addAction(UIAlertAction(title: "add", style: .default, handler: nil))
        alrController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alrController.view.addSubview(tableView)
    
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
