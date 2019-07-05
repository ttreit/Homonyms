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
        
//set the initial button text depending on whether a user is currently logged in or not.
        if Auth.auth().currentUser == nil {
            btnLogin.setTitle("Login", for: .normal)
        } else {
            btnLogin.setTitle("Logout", for: .normal)
        }
    }
   

    @IBAction func addItem(_ sender: Any) {
        //add the word to the view so user can see it
        if let text = wordToAddField.text {
            viewSetWords.text.append("\(text)\n")
        }
        // trim spaces from beginning and end of submitted words
        var trimmed: String = wordToAddField.text ?? ""
        trimmed = trimmed.trimmingCharacters(in: .whitespacesAndNewlines)
        homonymSet.insert(trimmed)
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
                if password.count < 6 {
                    let alert = UIAlertController(title: "Oops!", message: "Passwords must be at least six characters long.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Close", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                print (user?.user.email ?? "No Email")
                print (Auth.auth().currentUser?.uid ?? "No UserID")
                self.textFieldEmail.text = ""
                self.textFieldPassword.text = ""
        
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
