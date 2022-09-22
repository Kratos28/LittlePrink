//
//  TabBarC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/12.
//

import UIKit
import YPImagePicker
import AVFoundation
import LeanCloud


class TabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self;
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC
        {
            
            if let _ = LCApplication.default.currentUser{
                
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
                config.showsVideoTrimmer = false;
                config.gallery.hidesRemoveButton = false;
                let picker = YPImagePicker(configuration: config);
                picker.didFinishPicking {[unowned picker] items, cancelled in
                    if cancelled{
                        picker.dismiss(animated: true);
                    }else
                    {
                        var photos :[UIImage] = [];
                        var videoURL:URL?
                        for item in items {
                            switch item {
                            case let .photo(photo):
                                print(photo);
                                photos.append(photo.image);
                            case .video:
                                
                               let url =  URL(fileURLWithPath: "",relativeTo: FileManager.default.temporaryDirectory);
                                photos.append(url.thumbnail);
                                videoURL = url
                            }
                        }
                        let vc = self.storyboard!.instantiateViewController(withIdentifier: kNoteEditVCID) as! NoteEditVC;
                        vc.photos = photos;
                        vc.videoURL = videoURL;
                        picker.pushViewController(vc, animated: true)
                    }
                }
                present(picker, animated: true)
            }else
            {
                let alert = UIAlertController(title: "提示", message: "需要先登录", preferredStyle: .alert);
                let action1 = UIAlertAction(title: "再看看", style: .cancel,handler: nil);
                let action2 = UIAlertAction(title: "去登录", style:.default)
                { _ in
                    tabBarController.selectedIndex = 4;
                    
                };
                alert.addAction(action1);
                alert.addAction(action2);
                present(alert, animated: true);
            }
    
            return false;
        }
        return true;
    }
    
 


}
