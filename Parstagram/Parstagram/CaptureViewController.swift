//
//  CaptureViewController.swift
//  Parstagram
//
//  Created by Diana Fisher on 12/31/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapped(_ sender: UITapGestureRecognizer) {
        print("Tapped")
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
