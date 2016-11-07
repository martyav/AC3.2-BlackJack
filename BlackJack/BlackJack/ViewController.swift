//
//  ViewController.swift
//  BlackJack
//
//  Created by Marty Avedon on 11/7/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // below two lines are from http://stackoverflow.com/questions/27037839/force-landscape-mode-in-one-viewcontroller-using-swift
        // they lock the device's orientation into landscape mode
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

