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
        
        tableView.rowHeight = 446.0
        
        refreshControl.addTarget(self, action: #selector(loadPosts), for: .valueChanged)
        tableView.refreshControl = refreshControl                        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            if error != nil {
                print("Error:\(error!.localizedDescription)")
            } else {
                self.posts = objects!
                self.tableView.reloadData()
            }
            
            self.refreshControl.endRefreshing()
        }
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        PFUser.logOutInBackground { (error) in
            // PFUser.current() will now be nil
            if error != nil {
                print("Error:\(error!.localizedDescription)")
            } else {
                print("logged out")
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
        let url = URL(string: fileObject.url!)!
        postCell.postImageView.af_setImage(withURL: url)
        
        let author = post["author"] as! PFUser
        postCell.usernameLabel.text = author.username
        
        let caption = post["caption"] as! String
        postCell.caption.text = caption
        
        return postCell
    }
    
}
