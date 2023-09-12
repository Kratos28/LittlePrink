
//
//  AppDelegate-PUSH.swift
//  LittlePink
//
//  Created by 9130Game on 2023/9/4.
//

import Foundation
import LeanCloud
extension AppDelegate
{
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            
        
        let installation = LCApplication.default.currentInstallation;
        installation.set(deviceToken: deviceToken, apnsTeamId: "R3Rw3ZDBN")
        if installation.get(kUserCol) == nil,let user = LCApplication.default.currentUser{
            try? installation.set(kUserCol, value: user);
        }
        installation.save{ (result) in}
        
        
    }
}

extension AppDelegate : UNUserNotificationCenterDelegate
{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo;
        if let noteID =  userInfo["noteID"] as? String{
            let query = LCQuery(className: kNoteTable)
            query.whereKey(kAuthorCol, .included);
            UIViewController.showGlobalLoadHud();
            query.get(noteID){res in
                UIViewController.hideGlobalHUD();
                if case let  .success(object: note) = res{
                    
                    guard let  rootVC =    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController as? UITabBarController else {return}
                    
                   let storyboard =  UIStoryboard(name: "Main", bundle: nil);
                    let detailVC = storyboard.instantiateViewController(identifier: kNoteDetailVCID) { coder in
                        NoteDetailVC(coder: coder, note: note);
                    }
                    rootVC.selectedViewController?.present(detailVC, animated: true);
                    
                }
            }
        }
        completionHandler();
    }
}
