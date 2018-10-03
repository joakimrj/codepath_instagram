//
//  UploadViewController.swift
//  instagram
//
//  Created by Joakim Jorde on 10/1/18.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit
import Parse

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let vc = UIImagePickerController()

    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var discriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate a UIImagePickerController
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerController.SourceType.camera
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func onCamera(_ sender: Any) {
        vc.sourceType = .camera
         self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onLibrary(_ sender: Any) {
        vc.sourceType = .photoLibrary
         self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        Post.postUserImage(image: photoImageView.image, withCaption: discriptionText.text, withCompletion: { (success, error) in
            if (success) {
                // The object has been saved.
                print("Succesed")
                self.photoImageView.image = UIImage(named: "image_placeholder")
                self.discriptionText.text = ""
                self.view.endEditing(true)
                
                
                
            } else {
                // There was a problem, check error.description
                print(error.debugDescription)
            }
        })
    }

    
    func imagePickerController(_ picker: UIImagePickerController,
                                       didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Get the image captured by the UIImagePickerController
        let selectedImage = info[.originalImage] as! UIImage
       
        
        let editedImage = resize(image: selectedImage)


        
        // Do something with the images (based on your use case)
        photoImageView.image = editedImage
       // photoImageView.reloadInputViews()
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    func resize(image: UIImage) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRect(x:0,y:0,width:375,height:375))
        resizeImageView.contentMode = UIView.ContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
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
