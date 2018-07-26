//
//  PostTableViewCell.swift
//  RedditObjC
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    // MARK: - Properties
    var post: ZMFPost? {
        didSet {
            updateViews()
        }
    }
    
    var postImage: UIImage? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    func updateViews() {
        guard let post = post else { return }
        titleLabel.text = post.title
        upsLabel.text = "👍 \(post.ups)"
        commentCountLabel.text = "💬 \(post.commentCount)"
        postImageView.image = postImage
    }
    
}
