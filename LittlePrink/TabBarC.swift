//
//  TabBarC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/12.
//

import UIKit
import YPImagePicker
import AVFoundation

class TabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self;
        // Do any additional setup after loading the view.
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC
        {
            
            var config = YPImagePickerConfiguration();
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.albumName = "DefaultYPImagePickerAlbumName"
            config.albumName =   Bundle.main.appName;
            config.startOnScreen = YPPickerScreen.library
            config.screens = [.library,.video,.photo];
            config.maxCameraZoomFactor = KMaxCameraZoomFactor;
            
            
            config.library.defaultMultipleSelection = true;
            config.library.maxNumberOfItems = kMaxPhotoCount;
            config.library.spacingBetweenItems = 2.0;
            config.gallery.hidesRemoveButton = false;
            
            
            config.video.compression = AVAssetExportPresetHighestQuality
            config.video.fileType = .mov;
            config.video.recordingTimeLimit = 60.0;
            config.video.libraryTimeLimit = 60;
            config.video.minimumTimeLimit = 3.0;
            config.video.trimmerMaxDuration = 60.0;
            config.video.trimmerMinDuration = 3.0;
        
            
            config.gallery.hidesRemoveButton = false;
            let picker = YPImagePicker(configuration: config);
            picker.didFinishPicking {[unowned picker] items, cancelled in
                
                if cancelled{
        
                }
                
                for item in items {
                    switch item {
                    case let .photo(photo):
                        print(photo);
                        
                    case .video(let video):
                        print(video);
                    }
                }
                
                picker.dismiss(animated: true,completion: nil);
            }
            
            present(picker, animated: true)
            
            return false;
        }
        return true;
    }
    
 


}
