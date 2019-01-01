//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Diana Fisher on 12/31/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellReuseIdentifier = "postCell"
    var posts: [Post] = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        loadPosts()
    }
    
    func loadPosts() {
        // construct PFQuery
        guard let query = Post.query() else { return }
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts, error) in
            if let error = error {
                print("Error:\(error.localizedDescription)")
            } else {
                self.posts = posts as! [Post]
                self.tableView.reloadData()
            }
        }
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! PostTableViewCell
        
        let post = self.posts[indexPath.row]
        postCell.prepare(with: post)
        
        return postCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 404.5
    }
}
