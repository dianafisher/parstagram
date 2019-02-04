//
//  CaptureViewController.swift
//  Parstagram
//
//  Created by Diana Fisher on 12/31/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit
import Parse

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var capturedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapped(_ sender: UITapGestureRecognizer) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            vc.sourceType = UIImagePickerController.SourceType.camera
        } else {
            vc.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Get the image captured by the UIImagePickerController
//        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let editedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        // Do something with images
        capturedImageView.image = editedImage
        
        // Dismiss UIImagePickerController
        dismiss(animated: true, completion: nil)
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage? {        
        let resizeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        resizeImageView.contentMode = UIView.ContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func onSubmitPressed(_ sender: Any) {
        let image = capturedImageView.image
        let caption = "Placeholder"

        guard let currentUser = PFUser.current() else { return }
        
        if let image = image {
            if let imageData = image.pngData() {
                let fileObject = PFFileObject(name: "image.png", data: imageData)
                let post = PFObject(className: "Post")
                post["author"] = currentUser
                post["caption"] = caption
                post["likesCount"] = 0
                post["commentsCount"] = 0
                post["media"] = fileObject
                post.saveInBackground { (success, error) in
                    if (success) {
                        print("Successfully posted!")
                    } else {
                        print("ERROR: \(String(describing: error?.localizedDescription))")
                    }
                }
            }
        }
    }
}
