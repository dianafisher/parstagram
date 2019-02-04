//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Diana Fisher on 12/31/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        loadPosts()
    }
    
    func loadPosts() {
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data
        query.findObjectsInBackground { (objects, error) in
            if let posts = objects {
                self.posts = posts
                self.tableView.reloadData()
            } else {
                if let error = error {
                    print("Error:\(error.localizedDescription)")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        
        let post = self.posts[indexPath.row]

        let fileObject = post["media"] as! PFFileObject
        fileObject.getDataInBackground { (data, error) in
            if let imageData = data {
                let image = UIImage(data: imageData)
                postCell.postImageView.image = image
            }
        }
        
        return postCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 404.5
    }
}
