//
//  Test.swift
//  groupShopper
//
//  Created by Ethan Young on 7/4/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tesseract:G8Tesseract = G8Tesseract(language:"eng+ita")
        //tesseract.language = "eng+ita"
        tesseract.delegate = self
        tesseract.charWhitelist = "01234567890"
        tesseract.image = UIImage(named: "image_sample.jpg")
        tesseract.recognize()
        
        print(tesseract.recognizedText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func shouldCancelImageRecognitionForTesseract(tesseract: G8Tesseract!) -> Bool {
        return false // return true if you need to interrupt tesseract before it finishes
    }
}
