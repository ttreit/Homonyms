//
//  ViewController.swift
//  Homonym Tracker
//
//  Created by Tammy Treit on 6/10/19.
//  Copyright © 2019 MammothSound. All rights reserved.
//

import UIKit

var homonymSet = Set<String>()  //holds the sets of words that make up 1 homonym unit
var homonyms = Set<Set<String>>() //the superset that consists of all of the sets of honomyms

class ViewController: UIViewController {
    @IBOutlet weak var wordToAddField: UITextField!
    @IBOutlet weak var viewSetWords: UITextView! //Shows words before they are commited to a set
    @IBOutlet weak var homonymListView: UITextView! //Shows the complete list of homonyms
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addItem(_ sender: Any) {
        //add the word to the view so user can see it
        if let text = wordToAddField.text {
            viewSetWords.text.append("\(text)\n")
        }
        
        homonymSet.insert(wordToAddField.text ?? "")
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
        homonymListView.text = ""
        for homonymSets in homonyms {
            print("\n")
            homonymListView.text.append("\n")
            
            for elements in homonymSets {
            print("\(elements)")
                if let text: String = elements {
                    homonymListView.text.append("\(text)\n")
                    
                }
                
                
                
            }
      
        
        }

    
    }


}
