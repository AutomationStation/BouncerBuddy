//
//  ViewController.swift
//  takephoto
//
//  Created by Jiaxi Liu on 3/6/16.
//  Copyright © 2016 Jiaxi Liu. All rights reserved.
//

import UIKit

class ScanningHubViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let background = CAGradientLayer().turquoiseColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func chooseImageFromPhotoLibrary() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func chooseImageFromCamera() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = (info[UIImagePickerControllerOriginalImage] as! UIImage)
        dismissViewControllerAnimated(true, completion: nil)
    
    }
    

    
    

}

