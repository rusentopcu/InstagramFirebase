//
//  UploadViewController.swift
//  InstagramFirebase
//
//  Created by Rusen Topcu on 28.02.2020.
//  Copyright © 2020 Rusen Topcu. All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textComment: UITextField!
    @IBOutlet weak var outletButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }

    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func makeAlert(title: String, mesaj: String) {
        
        let alarm = UIAlertController(title: title, message: mesaj, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alarm.addAction(okButton)
        self.present(alarm, animated: true, completion: nil)
    }
    
    
    @IBAction func actionButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage() //Storage sınıfından, storage instance oluşturuldu.
        let storageReferans = storage.reference() //Storage alanı için ref oluşturuldu
        let mediaFolder = storageReferans.child("media") //Kayıt edilecek klasör ref
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            imageReferance.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    self.makeAlert(title: "Error!", mesaj: error?.localizedDescription ?? "Hata")
                }
                else {
                    imageReferance.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                    }
                }
            }
            
        }
        
    }
    
    
}
