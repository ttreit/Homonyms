//
//  ViewController.swift
//  Homonym Tracker
//
//  Created by Tammy Treit on 6/10/19.
//  Copyright © 2019 MammothSound. All rights reserved.
//

import UIKit

var homonymSet = Set<String>()
var wordToAdd: String = ""
var homonymArray = [Set<String>]()

class ViewController: UIViewController {
    @IBOutlet weak var wordToAddField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addItem(_ sender: Any) {
        wordToAdd = wordToAddField.text ?? ""
        homonymSet.insert(wordToAdd)
        print(homonymSet)
        //wordToAddField.resignFirstResponder()
        
    }
    
    @IBAction func addHomonymSet(_ sender: Any) {
        homonymArray.append(homonymSet)
        print(homonymArray)
        homonymSet = Set<String>()
        print(homonymSet)
        
    }
    
}

