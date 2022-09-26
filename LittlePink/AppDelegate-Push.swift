//
//  AppDelegate-Push.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/22.
//

import LeanCloud

extension AppDelegate{
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let installation = LCApplication.default.currentInstallation
        
        installation.set(deviceToken: deviceToken, apnsTeamId: "R3R9W3ZDBN")
        
        //防止在用户登录时写入数据失败,故在每次用户打开App时继续判断处理
        if installation.get(kUserCol) == nil, let user = LCApplication.default.currentUser{
            try? installation.set(kUserCol, value: user)
        }
        
        installation.save { _ in }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate{
    //用户点击推送后触发
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo//获取payload,进而获取传过来的noteID
        
        //通过传过来的noteID获取到note对象,用来构建NoteDetailVC
        if let noteID = userInfo["noteID"] as? String{
            let query = LCQuery(className: kNoteTable)
            query.whereKey(kAuthorCol, .included)
            UIViewController.showGlobalLoadHUD()
            query.get(noteID) { res in
                UIViewController.hideGlobalHUD()
                if case let .success(object: note) = res{
                    //获取tabBarC
                    guard let tabBarC = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController as? UITabBarController else { return }
                    
                    //构建NoteDetailVC
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let detailVC = storyboard.instantiateViewController(identifier: kNoteDetailVCID) { coder in
                        NoteDetailVC(coder: coder, note: note)
                    }
                    detailVC.modalPresentationStyle = .fullScreen
                    detailVC.isFromPush = true
                    tabBarC.selectedViewController?.present(detailVC, animated: true)
                }
            }
        }
        
        
        completionHandler()//固定用法
    }
}
