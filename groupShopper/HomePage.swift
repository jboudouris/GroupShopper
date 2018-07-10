//
//  HomeController.swift
//  groupShopper
//
//  Created by Ethan Young on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class HomePage: UIViewController {

    var button = UIButton(frame: CGRect())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        title = "Home"
        
        // Button to advance to next page (create a new list)
        button.setTitle("Make New List", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(HomePage.showNextPage), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set button frame to be placed centered in the view controller
        // TODO: find a more elegant way to display this
        button.frame = CGRect(x: 0, y: view.frame.height / 2 - 15, width: view.frame.width, height: 30)
    }
    
    @objc func showNextPage() {
        navigationController?.pushViewController(PickGroupPage(), animated: true)
    }
}
