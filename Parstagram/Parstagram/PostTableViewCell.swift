//
//  PostTableViewCell.swift
//  Parstagram
//
//  Created by Diana Fisher on 12/31/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var caption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with post: Post) {
        post.media.getDataInBackground { (imageData: Data?, error: Error?) in
            if let error = error {
                print("Error:\(error.localizedDescription)")
            } else if let imageData = imageData {
                let image = UIImage(data: imageData)
                self.postImageView.image = image
            }
        }
        
        caption.text = post.caption
    }

}
