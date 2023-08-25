
//  EditProfileTableVC-PHPickerVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import PhotosUI
extension EditProfileTableVC: PHPickerViewControllerDelegate
{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)

   

        let itemProvider = results.first?.itemProvider;
        if let itemProvider =  itemProvider,itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) {
                [weak self] image, error in
                guard let self =  self, let image = image as? UIImage else {return}
                DispatchQueue.main.async {
                    self.avatar = image;
                    
                }
            }
        }
        
    }
}
