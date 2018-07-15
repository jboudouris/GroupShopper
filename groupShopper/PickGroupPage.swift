//
//  pickGroupPage.swift
//  groupShopper
//
//  Created by James Boudouris on 6/24/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class PickGroupPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView(frame: CGRect(), style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pick a group"
        view.backgroundColor = UIColor.white
        
        // Show added items
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.setEditing(true, animated: true)
        tableView.allowsSelectionDuringEditing = true
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.reloadData()
    }
    
    
    @objc func showNextPage() {
        navigationController?.pushViewController(AddItemsPage(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList.count + 1
    }
    
    // populate the list of groups
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        if indexPath.row != groupList.count {
            cell.textLabel?.text = groupList[indexPath.row].name // maybe?
        } else {
            cell.textLabel?.text = "click to add a new group"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupList.remove(at: indexPath.row)
            currentGroup = 0
            tableView.reloadData()
        }
        if editingStyle == .insert {
            // popup to make group name
            let alert = UIAlertController(title: "Choose a group name", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "new group"
            })
            
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
  
                if let groupName = alert.textFields?.first?.text {
                    groupList.append(Group(name: groupName))
                    currentGroup = groupList.count - 1 // check this number
                    self.navigationController?.pushViewController(AddGroupPage(), animated: true)
                }
            }))
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row < groupList.count {
            return .delete
        }
        return .insert
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.editingStyle == .delete {
            currentGroup = indexPath.row
            navigationController?.pushViewController(AddItemsPage(), animated: true)
        } else {
            // popup to make group name
            let alert = UIAlertController(title: "Choose a group name", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "new group"
            })
            
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
                
                if let groupName = alert.textFields?.first?.text {
                    groupList.append(Group(name: groupName))
                    currentGroup = groupList.count - 1 // check this number
                    self.navigationController?.pushViewController(AddGroupPage(), animated: true)
                }
            }))
            self.present(alert, animated: true)
        }
    }
}
