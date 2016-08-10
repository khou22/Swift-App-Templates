//
//  ProfileScreen.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/4/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//

import Foundation
import UIKit

class ProfileScreen: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Image picker controller delegate allows you to select an image from the camera or the photo library
    // Navigation controller delegate allows image picker to appear and dissapear like a normal view controller
    
    @IBOutlet weak var profilePictureImageView: UIImageView! // Image view we want to display the image in
    
    let imagePicker = UIImagePickerController() // Initialize an image picker view controller type
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self // States that this view controller will also handle the events
    }
    
    @IBAction func selectProfilePicture(sender: AnyObject) {
        
        let imageSourcePicker = UIAlertController(title: "Select Profile Picture", message: "Please select an image picker method", preferredStyle: .ActionSheet) // Initialize action sheet type
        
        let cameraAction = UIAlertAction(title: "Take a picture", style: .Default, handler: { action in
            self.pickImage(.Camera) // Presents picker
        })
        
        let cameraRoll = UIAlertAction(title: "Choose from camera roll", style: .Default, handler: { action in
            self.pickImage(.PhotoLibrary) // Presents picker
        })
        
        // Add actions
        imageSourcePicker.addAction(cameraAction)
        imageSourcePicker.addAction(cameraRoll)
        
        presentViewController(imageSourcePicker, animated: true, completion: nil)
        
    }
    
    func pickImage(sourceType: UIImagePickerControllerSourceType) {
        imagePicker.allowsEditing = false // Prevent editing
        
        // Three sources: .PhotoLibrary, .Camera, .SavedPhotosAlbum
        self.imagePicker.sourceType = sourceType // Type of image selection
        
        // Presenting image picker view controller on top of stack
        self.presentViewController(self.imagePicker, animated: true, completion: {
            print("Opening image picker view controller")
        })
    }
    
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // If returned a valid image
            profilePictureImageView.contentMode = .ScaleAspectFit // Set content setting
            profilePictureImageView.image = pickedImage // Set image
        }
        
        // Dismiss the image picker view controller
        dismissViewControllerAnimated(true, completion: {
            print("Dismissed image picker view controller")
        })
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the image picker view controller
        dismissViewControllerAnimated(true, completion: {
            print("Cancelled: Dismissed image picker view controller")
        })
    }
    
}