//
//  PostCell.swift
//  instagram
//
//  Created by Joakim Jorde on 10/2/18.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var postCaption: UILabel!
    @IBOutlet weak var postImage: PFImageView!
    
    var instagramPost: PFObject! {
        didSet {
            self.postImage.file = instagramPost["image"] as? PFFile
            self.postImage.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
