//
//  AddImagePrsenter.swift
//  Ra3ia
//
//  Created by Sara Mady on 06/06/2021.
//



import Foundation
import SKActivityIndicatorView
import Foundation
import UIKit

extension ChatViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    
    
  
    func AddImageAlert(){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.popoverPresentationController?.sourceView = view
        alert.addAction(UIAlertAction(title: "Photo from Camera".localized, style: .default, handler: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }))

        alert.addAction(UIAlertAction(title:"Photo from the studio".localized, style: .default, handler: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }))

        alert.view.tintColor =  UIColor.BasicColor
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Image Picker
    func imagePickerController(_ picker:UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let image_data = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        self.imageArray.append(image_data)
        uploadImge.append(UploadData(data:(image_data).pngData()! as Data , fileName: "Image.jpg", mimeType: "image/jpg", name: "file"))
        Prisnter.uploadNewImage(uploadData: self.uploadImge)
        self.optionView.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }
    
}
