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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Items"
        view.backgroundColor = UIColor.white
        
        itemList = ["A", "B", "C"] // temp
        
        // Button to advance page
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(AddItemsPage.showNextScreen), for: .touchUpInside)
        
        // Creates the plus button in the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddItemsPage.addItem))

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
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 50)
        tableView.reloadData()
    }
    
    
    @objc func showNextScreen() {
        navigationController?.pushViewController(AssignPage(), animated: true)
    }
    
    @objc func addItem() {
        
        // Creates a pop up prompting for item name and price
        let alert = UIAlertController(title: "Add an item", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input item name here..."
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input price here..."
        })
        
        // Add the price of the item
        
        alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { action in
            
            // Add updating of item list here
            if let name = alert.textFields?.first?.text {
                print("Your item: \(name)") // Prints to console as of now
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = itemList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
