//
//  ViewController.swift
//  Homonym Tracker
//
//  Created by Tammy Treit on 6/10/19.
//  Copyright © 2019 MammothSound. All rights reserved.
//

import UIKit
import Firebase

var homonymSet = Set<String>()  //holds the sets of words that make up 1 homonym unit
var homonyms = Set<Set<String>>() //the superset that consists of all of the sets of honomyms

class ViewController: UIViewController {
    @IBOutlet weak var wordToAddField: UITextField!
    @IBOutlet weak var viewSetWords: UITextView! //Shows words before they are commited to a set
    @IBOutlet weak var homonymListView: UITextView! //Shows the complete list of homonyms
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if Auth.auth().currentUser == nil {
            btnLogin.setTitle("Login", for: .normal)
        }
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

    @IBAction func onButtonCreate(_ sender: Any) {
        if let email = textFieldEmail.text, let password = textFieldPassword.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                print (user?.user.email ?? "No Email")
                print (Auth.auth().currentUser?.uid ?? "No UserID")
            })
        }
    }
    
    @IBAction func onButtonLogin(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            if let email = textFieldEmail.text, let password = textFieldPassword.text {
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error == nil {
                        self.btnLogin.setTitle("Logout", for: .normal)
                    }
                    
                })
            }
        }
        else {
            do {
                try Auth.auth().signOut()
                self.btnLogin.setTitle("Login", for: .normal)
            }
            catch {}
            
        }
    }
}
