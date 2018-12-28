//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Diana Fisher on 12/27/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignIn(_ sender: Any) {
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Yay, created a user!")
            } else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    if (error as NSError).code == 202 {
                        print("Username is taken")
                    }
                }
                
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
