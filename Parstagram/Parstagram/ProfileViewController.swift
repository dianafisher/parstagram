//
//  ProfileViewController.swift
//  Parstagram
//
//  Created by Diana Fisher on 12/31/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            // PFUser.current() will now be nil
        }
    }
    
}
