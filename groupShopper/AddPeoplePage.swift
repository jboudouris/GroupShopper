//
//  ViewController.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class AddPeople: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView(frame: CGRect(), style: .plain)
    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
   // var addPersonButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: YOUR_SELECTOR)
    //var addPersonButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(AddPeople.showNextScreen))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add People"
        view.backgroundColor = UIColor.white
        
//        personList = ["Apple", "Banana", "Carrot"] // temp, will be populated in this class
        
        
        // Button to advance to next page
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(AddPeople.showNextScreen), for: .touchUpInside)
        
        view.addSubview(button)
        
        // Creates the plus button in the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddPeople.addPerson))

        // Displays people in a list on page
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set advance button frame to be placed right justafied on the bottom of the screen // COULD USE CLEANUP ON PLACEMENT
        button.frame = CGRect(x: view.frame.width - 150, y: view.frame.height - 50, width: view.frame.width / 2, height: 50)
        button.reloadInputViews()
        
        // List frame takes up all but bottom of screen to allow room for "done" button
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 50)
        tableView.reloadData()
    }
    
    
    @objc func showNextScreen() {
        if personList.count < 2 {
            let alert = UIAlertController(title: "Not enough people", message: "You must add at least 2 people to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            navigationController?.pushViewController(AddItemsPage(), animated: true)
        }
    }
    
    @objc func addPerson() {
        
        // Creates a pop up prompting for item name and price
        let alert = UIAlertController(title: "Add a person", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input person name here..."
        })
        
        // Add the price of the item
        
        alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { action in
            
            // Add updating of item list here
            if let name = alert.textFields?.first?.text {
                personList.append(Person(name: name))
//                print("Your name: \(name)") // Prints to console as of now
            }
            self.tableView.reloadData()
            self.tableView.reloadInputViews()
        }))

        self.present(alert, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            personList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

