//
//  AssignPage.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class AssignPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView(frame: CGRect(), style: .plain)
    var button = UIButton(frame: CGRect())
    var switchPersonButton = UIButton(frame: CGRect())
    
    var remainingPersonCount = personList.count // tracks which person items are being checked off for
    var currentPerson = personList[0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.white
        
        title = "Assign Items: " + currentPerson.name // Creates title for first person
        
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(AssignPage.showNextScreen), for: .touchUpInside)
        
        switchPersonButton.setTitle("Next Person", for: .normal)
        switchPersonButton.setTitleColor(UIColor.blue, for: .normal)
        switchPersonButton.addTarget(self, action: #selector(AssignPage.nextPerson), for: .touchUpInside)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(switchPersonButton)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set advance button frame to be placed right justafied on the bottom of the screen // COULD USE CLEANUP ON PLACEMENT
        button.frame = CGRect(x: view.frame.width - 150, y: view.frame.height - 50, width: view.frame.width / 2, height: 50)
        button.reloadInputViews()
        
        // Next person button frame to be right justafied on bottom of screen
        switchPersonButton.frame = CGRect(x: view.frame.width - 180, y: view.frame.height - 50, width: view.frame.width / 2, height: 50)
        switchPersonButton.reloadInputViews()
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 50)
        tableView.reloadData()
        
        view.addSubview(tableView)
        
    }
    
    @objc func showNextScreen() {
        // update to only show on last person
        navigationController?.pushViewController(TotalsPage(), animated: true)
    }
    
    @objc func nextPerson() {
        // TODO: save checked item data from prev person
        
        // TODO: reset all checkmarks
        
        // Update name at top to next person
        // BUG: Doesn't work with one person
        remainingPersonCount = remainingPersonCount - 1
        currentPerson = personList[personList.count - remainingPersonCount]
        title = "Assign Items: " + currentPerson.name
        
        if remainingPersonCount == 1 {
            switchPersonButton.removeFromSuperview()
            view.addSubview(button)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = itemList[indexPath.row].name
        
        cell.accessoryType = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  cell = tableView.cellForRow(at: indexPath)
        if (cell!.accessoryType == .none) {
            cell!.accessoryType = .checkmark
        } else {
            cell!.accessoryType = .none
        }
    }
}
