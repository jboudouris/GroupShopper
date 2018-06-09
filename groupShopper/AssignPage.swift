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
    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    var switchPersonButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    
    var remainingPersonCount = personList.count
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Assign Items"
        
        itemList = ["A", "B", "C"]
        
        button.setTitle("Press this", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(AssignPage.showNextScreen), for: .touchUpInside)
        
        switchPersonButton.setTitle("Next Person", for: .normal)
        switchPersonButton.setTitleColor(UIColor.blue, for: .normal)
        switchPersonButton.addTarget(self, action: #selector(AssignPage.nextPerson), for: .touchUpInside)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(switchPersonButton)
        
        view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        button.frame = CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width/2, height: 50)
        button.reloadInputViews()
        
        switchPersonButton.frame = CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width/2, height: 50)
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
        // save checked item data from prev person
        
        // reset all checkmarks
        
        // update name at top to next person
        
        remainingPersonCount = remainingPersonCount - 1
        
        if remainingPersonCount == 0 {
            switchPersonButton.removeFromSuperview()
            view.addSubview(button)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = itemList[indexPath.row]
        
        cell.accessoryType = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemList.remove(at: indexPath.row)
            tableView.reloadData()
        }
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
