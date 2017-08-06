//
//  CameraViewController.swift
//  ShareATextbook
//
//  Created by nat on 28/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var takePicture: UIButton!
    @IBOutlet weak var selectPicture: UIButton!
    @IBOutlet weak var savePicture: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if !(UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.camera))
        {
            // If not, we will just hide the takePicture button //
            takePicture.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectPicture(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        // Setting this to true allows the user to crop and scale // the image to a square after the image is selected.
        //
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(
            picker, animated: true)
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        // Setting this to true allows the user to crop and scale // the image to a square after the photo is taken.
        //
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(
            picker, animated: true)
    }
    
    @IBAction func savePicture(sender: AnyObject) {
        addPhoto()
    }
    
    func convertImageToBase64(image: UIImage) -> String {
        var imageData = UIImagePNGRepresentation(image)
        let base64String = imageData?.base64EncodedString()
        return base64String!
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage : UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.imageView!.image = chosenImage
        let data = UIImagePNGRepresentation(chosenImage)
        picker.dismiss(animated: true)

    }

    
    func imagePickerControllerDidCancel(
        _ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true)
    }
    
    func addPhoto(){
        PhotoDataManager.addphoto(token: LoginGlobalVar.token, file: "")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
