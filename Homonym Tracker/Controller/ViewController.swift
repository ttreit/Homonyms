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
var homonyms = Set<Set<String>>()
var homonymList = Set<String>()

class ViewController: UIViewController {
    @IBOutlet weak var wordToAddField: UITextField!
    @IBOutlet weak var viewSetWords: UITextView!
    @IBOutlet weak var homonymListView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addItem(_ sender: Any) {
       if let text = wordToAddField.text, text != "" {
            viewSetWords.text.append("\(text)\n")
        }
        
        wordToAdd = wordToAddField.text ?? ""
        homonymSet.insert(wordToAdd)
        print("HomonymSet Create: \(homonymSet)")
        wordToAddField.resignFirstResponder()
        wordToAddField.text = ""
        
    }
    
    @IBAction func addHomonymSet(_ sender: Any) {
        homonyms.insert(homonymSet)
        print ("homonyms: \(homonyms)")
        homonymSet = Set<String>()
        print("homonymSet Clear: \(homonymSet)")
        viewSetWords.text = ""
    }
 
    @IBAction func listHomonyms(_ sender: Any) {
        for homonymSets in homonyms {
            print("\n")
            homonymListView.text.append("\n")
            
            for elements in homonymSets {
            print("\(elements)")
                if let text: String = elements {
                    homonymListView.text.append("\(text)\n")
                    
                }
                
                /*
                 if let text = wordToAddField.text, text != "" {
                 viewSetWords.text.append("\(text)\n")
                 }
                 
                 wordToAdd = wordToAddField.text ?? ""
                 homonymSet.insert(wordToAdd)
                 print("HomonymSet Create: \(homonymSet)")
                 wordToAddField.resignFirstResponder()
                 wordToAddField.text = ""
                 */
                
                
            }
      
        
        }

    
    }


}
