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
    let refreshControl = UIRefreshControl()
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(loadPosts), for: .valueChanged)
        tableView.refreshControl = refreshControl        
        
        // Do any additional setup after loading the view.
        loadPosts()
    }
        
    @objc func loadPosts() {
        // start spinning
        refreshControl.beginRefreshing()
        
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
            self.refreshControl.endRefreshing()
        }
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            // PFUser.current() will now be nil
            self.dismiss(animated: true, completion: nil)
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
                
                let author = post["author"] as! PFUser
                postCell.usernameLabel.text = author.username
                
                let caption = post["caption"] as! String
                postCell.caption.text = caption
            }
        }
        
        return postCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 446.0
    }
}
