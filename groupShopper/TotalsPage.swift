//
//  TotalsPage.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class TotalsPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var tableView = UITableView(frame: CGRect(), style: .plain)
    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Totals Page"
        view.backgroundColor = UIColor.white
        
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(TotalsPage.toHome), for: .touchUpInside)
        
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
        
        // List frame takes up all but bottom of screen to allow room for "done" button
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 50)
        tableView.reloadData()
    }
    
    
    @objc func toHome() {
        navigationController?.pushViewController(HomePage(), animated: true)
        // TODO: reset all variables?? / option to save data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = personList[indexPath.row].name + ": " + String(personList[indexPath.row].total)
        
        return cell
    }
}
