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
    @IBOutlet weak var viewSetWords: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addItem(_ sender: Any) {
        if let text = wordToAddField.text, text != "" {
            viewSetWords.text.append("\(text)\n")
        }
        
        wordToAdd = wordToAddField.text ?? ""
        homonymSet.insert(wordToAdd)
        print(homonymSet)
        wordToAddField.resignFirstResponder()
        wordToAddField.text = ""
        
    }
    
    @IBAction func addHomonymSet(_ sender: Any) {
        homonymArray.append(homonymSet)
        print(homonymArray)
        homonymSet = Set<String>()
        print(homonymSet)
        viewSetWords.text = ""
        
    }
    
}

