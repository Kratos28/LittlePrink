
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
            
        
        LCApplication.default.currentInstallation.set(deviceToken: deviceToken, apnsTeamId: "")
        LCApplication.default.currentInstallation.save{ (result) in
        
            
        }
        
    }
}
