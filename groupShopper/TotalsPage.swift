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
        
        totals = ["A", "B", "C"]
        
        button.setTitle("Press this", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(TotalsPage.toHome), for: .touchUpInside)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        view.addSubview(button)
        
        view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        button.frame = CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width/2, height: 50)
        button.reloadInputViews()
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 50)
        tableView.reloadData()
    }
    
    
    @objc func toHome() {
        navigationController?.pushViewController(HomeController(), animated: true)
        // reset all variables??
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = totals[indexPath.row]
        
        return cell
    }
}
