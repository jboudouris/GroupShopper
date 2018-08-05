//
//  AddGroupPage.swift
//  groupShopper
//
//  Created by James Boudouris on 7/8/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class AssignPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView(frame: CGRect(), style: .plain)
    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "assign page"
        view.backgroundColor = UIColor.white
        
        // Creates the done button in the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AssignPage.showNextPage))
        
        // Displays people in a list on page
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.reloadData()
    }
    
    @objc func showNextPage() {
        navigationController?.pushViewController(AddItemsPage(), animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList[currentGroup].members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        cell.textLabel?.text = groupList[currentGroup].members[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
    }
}


