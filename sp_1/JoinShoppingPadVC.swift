//
//  JoinShoppingPadVC.swift
//  TestSP
//
//  Created by Vidya Ramamurthy on 21/01/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit



class JoinShoppingPadVC:  UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var showImage: UIImageView!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    //code for picking up the image from gallary
    let imagePicker = UIImagePickerController()
    let imagePicker1 = UIImagePickerController()
    var ImagePicked = 0
    
    @IBAction func addBackGround(sender: AnyObject)
    {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        ImagePicked = 0
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            if (ImagePicked == 0)
            {
            //showImage.frame = CGRectMake(13,70,294,144)
                
            showImage.contentMode = .ScaleAspectFit
            showImage.image = pickedImage
                //showImage.contentMode = UIViewContentMode.ScaleAspectFit
            }
            if (ImagePicked == 1)
            {
        
                profilePhoto.layer.borderWidth = 1.0
                profilePhoto.layer.masksToBounds = false
                profilePhoto.layer.borderColor = UIColor.whiteColor().CGColor
                profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width/2
                profilePhoto.clipsToBounds = true
                profilePhoto.image = pickedImage
                
            }
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if(segue.identifier == "logInSegue")
            {
            }
       }
    
    
       
    
    @IBAction func addProfilePhotoBttn(sender: AnyObject) {
        ImagePicked = 1
        imagePicker1.allowsEditing = false
        imagePicker1.sourceType = .PhotoLibrary
        presentViewController(imagePicker1, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker1.delegate = self

        // Do view setup here.
    }
    


}
