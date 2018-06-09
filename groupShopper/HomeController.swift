//
//  HomeController.swift
//  groupShopper
//
//  Created by Ethan Young on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Home"
        
        button.setTitle("Press this", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(HomeController.showNextPage), for: .touchUpInside)
        
        
        view.addSubview(button)
        
        view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        button.frame = CGRect(x: view.frame.height / 2 - 50, y: view.frame.height / 2 - 15, width: 100, height: 30)
    }
    
    @objc func showNextPage() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    

}
