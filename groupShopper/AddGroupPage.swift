//
//  AddGroupPage.swift
//  groupShopper
//
//  Created by James Boudouris on 7/8/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class AddGroupPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView(frame: CGRect(), style: .plain)
    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = groupList[currentGroup].name
        view.backgroundColor = UIColor.white
        
        // Creates the done button in the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddGroupPage.showNextPage))
        
        // Displays people in a list on page
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
        navigationController?.pushViewController(PickGroupPage(), animated: true)
    }
    
    @objc func addPerson() {
        // Creates a pop up prompting for adding person
        let alert = UIAlertController(title: "Add a person", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input person name here..."
        })
        
        alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { action in
            
            // Add updating of item list here
            if let name = alert.textFields?.first?.text {
                groupList[currentGroup].addPerson(personName: name)
            }
            self.tableView.reloadData()
            self.tableView.reloadInputViews()
        }))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList[currentGroup].members.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        if indexPath.row != groupList[currentGroup].members.count {
            cell.textLabel?.text = groupList[currentGroup].members[indexPath.row].name
        } else {
            cell.textLabel?.text = "add a group member"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if editingStyle == .delete {
            groupList[currentGroup].removePerson(personName: cell?.textLabel?.text ?? "")
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row < groupList[currentGroup].members.count {
            return .delete
        }
        return .insert
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.editingStyle == .insert {
            addPerson()
        }
    }
}


