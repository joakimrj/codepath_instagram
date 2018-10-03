//
//  DetailViewController.swift
//  instagram
//
//  Created by Joakim Jorde on 10/2/18.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    var post: PFObject!
   @IBOutlet weak var postImageView: UIImageView!
   @IBOutlet weak var timestampLabel: UILabel!
   @IBOutlet weak var captionLabel: UILabel!
    
    var postImage : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postImageView.image = postImage
        self.timestampLabel.text = post["timestamp"] as? String
        self.captionLabel.text = post["caption"] as? String
        
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
