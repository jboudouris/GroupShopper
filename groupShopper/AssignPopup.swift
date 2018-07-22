//
//  AssignPopup.swift
//  groupShopper
//
//  Created by Ethan Young on 7/22/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class AssignPopup: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.setHidesBackButton(true, animated:true);
        //self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
       

        // Do any additional setup after loading the view.
        //view.backgroundColor = UIColor.white
        //view.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        //view.backgroundColor = UIColor.clear
        //view.isOpaque = false
        title = "Home"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //view.backgroundColor = UIColor.clear
        //view.isOpaque = false
    }
    
}
