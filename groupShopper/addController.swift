//
//  addController.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit

class addController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        if textField.hasText {
            todoList.append(textField.text!)
            textField.text = ""
            textField.placeholder = "add another?"
        }
    }
    

}
