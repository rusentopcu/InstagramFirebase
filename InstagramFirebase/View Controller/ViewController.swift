//
//  ViewController.swift
//  InstagramFirebase
//
//  Created by Rusen Topcu on 28.02.2020.
//  Copyright © 2020 Rusen Topcu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //MARK: -Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
    }


    
    @IBAction func signinClicked(_ sender: Any) {
        
        if (emailText.text! != "" && passwordText.text! != "") {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if(error != nil) {
                    self.makeAlert(titleinput: "Error", messageinput: error!.localizedDescription)
                }
                
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
            
        else {
            self.makeAlert(titleinput: "Error", messageinput: "Username/Password not empty!")
        }
    }
    
    
    @IBAction func signupClicked(_ sender: Any) {
        
        if (emailText.text != "" && passwordText.text != "") {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleinput: "Error", messageinput: error?.localizedDescription ?? "Hatalı")
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }
        else {
            makeAlert(titleinput: "ERROR!!!", messageinput: "Username/Password")
        }
        
    }
    
    @objc func makeAlert(titleinput: String, messageinput: String) {
        let alarm = UIAlertController(title: titleinput, message: messageinput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alarm.addAction(okButton)
        present(alarm, animated: true, completion: nil)
    }
    
}

