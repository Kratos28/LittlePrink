//
//  EditProfileTableVC-PHPickerVCDelegate.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/11.
//

import PhotosUI

extension EditProfileTableVC: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        //多选时这样取:
        //let itemProviders = results.map(\.itemProvider) //这里的'\'和'$0'都是指数组里的每个元素
        
        //单选时这样取:
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self){
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                guard let self = self, let image = image as? UIImage else { return }
                self.avatar = image
            }
        }
    }
}
