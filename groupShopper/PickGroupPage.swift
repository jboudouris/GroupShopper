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
            tableView.reloadData()
        }
        if editingStyle == .insert {
            groupList.append(Group(name: "new group"))
            currentGroup = groupList.count - 1 // check this number
            navigationController?.pushViewController(AddGroupPage(), animated: true)
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
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
//        if cell?.editingStyle == .insert {
//            navigationController?.pushViewController(AddGroupPage(), animated: true)
//        }
    }
}
