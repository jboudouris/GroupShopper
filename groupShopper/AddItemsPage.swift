//
//  AddItemsPage.swift
//  groupShopper
//
//  Created by Ethan Young on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class AddItemsPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var tableView = UITableView(frame: CGRect(), style: .plain)
    var button = UIButton(frame: CGRect())
    var assignButton = UIButton(frame: CGRect())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Items"
        view.backgroundColor = UIColor.white
        
        // Creates the done button in the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddItemsPage.showNextScreen))

        // Show added items
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set advance button frame to be placed right justafied on the bottom of the screen // COULD USE CLEANUP ON PLACEMENT
        button.frame = CGRect(x: view.frame.width - 150, y: view.frame.height - 50, width: view.frame.width / 2, height: 50)
        button.reloadInputViews()
        tableView.allowsSelectionDuringEditing = true
        tableView.setEditing(true, animated: true)
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.reloadData()
    }
    
    
    @objc func showNextScreen() {
        navigationController?.pushViewController(TotalsPage(), animated: true)
    }
    
    @objc func assignItem() {
        print("It works!")
    }
    
    @objc func addItem() {
        // Creates a pop up prompting for item name and price
        let alert = UIAlertController(title: "Add an item", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input item name here..."
            textField.text = ""
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input price here..."
        })
        
        alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { action in
            // Add updating of item list here
            if let name = alert.textFields?[0].text, let price = Double(alert.textFields![1].text!) {
                itemList.append(Item(name: name, price: price))
                self.tableView.reloadData()
                self.tableView.reloadInputViews()
            } // add else statement to prompt to enter values
        }))
        
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        if indexPath.row != itemList.count {
            cell.textLabel?.text = itemList[indexPath.row].name + ": $" + String(itemList[indexPath.row].price)
        } else {
            cell.textLabel?.text = "click to add a new item"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row < itemList.count {
            return .delete
        }
        return .insert
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemList.remove(at: indexPath.row)
            tableView.reloadData()
        }
        if editingStyle == .insert {
            let alert = UIAlertController(title: "Add an item", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "Input item name here..."
                textField.text = ""
            })
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "Input price here..."
            })
            alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { action in
                // Add updating of item list here
                if let name = alert.textFields?[0].text, let price = Double(alert.textFields![1].text!) {
                    itemList.append(Item(name: name, price: price))
                    self.tableView.reloadData()
                    self.tableView.reloadInputViews()
                } // add else statement to prompt to enter values
            }))
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.editingStyle == .delete {
            let alrController = AssignPopup()

            self.present(alrController, animated: true)
            //let alert = UIAlertController(title: "Edit item", message: nil, preferredStyle: .alert)
            //alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
           // self.tableView.reloadData()
           // self.tableView.reloadInputViews()
            
            //self.present(alert, animated: true)
        }
        if cell?.editingStyle == .insert {
            let alert = UIAlertController(title: "Add an item", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "Input item name here..."
                textField.text = ""
            })
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "Input price here..."
            })
            alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { action in
                // Add updating of item list here
                if let name = alert.textFields?[0].text, let price = Double(alert.textFields![1].text!) {
                    itemList.append(Item(name: name, price: price))
                    self.tableView.reloadData()
                    self.tableView.reloadInputViews()
                } // add else statement to prompt to enter values
            }))
            self.present(alert, animated: true)
        }
    }
}
