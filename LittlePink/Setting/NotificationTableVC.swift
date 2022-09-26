//
//  NotificationTableVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/16.
//

import UIKit

class NotificationTableVC: UITableViewController {

    var isNotDetermined = false
    
    @IBOutlet weak var toggleAllowNotificationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @IBAction func toggleAllowNotification(_ sender: UISwitch){
        if sender.isOn, isNotDetermined{
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                if !granted{//若用户拒绝授权,则关闭开关
                    self.setSwitch(false)
                }
            }
            //reset处理.
            //防止用户在系统弹框时拒绝授权后再次打开开关,若此时isNotDetermined未reset(即true),则会试图再次请求系统授权,但此时已无法弹出系统授权弹框
            isNotDetermined = false
        }else{
            jumpToSetting()
        }
    }

}

extension NotificationTableVC{
    private func setUI(){
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus{
            case .notDetermined:
                self.setSwitch(false)
                self.isNotDetermined = true//设为true表明从未请求授权
            case .denied:
                self.setSwitch(false)
            default:
                self.setSwitch(true)
            }
        }
    }
    
    private func setSwitch(_ on: Bool){
        DispatchQueue.main.async {
            self.toggleAllowNotificationSwitch.setOn(on, animated: true)
        }
    }
    
    @objc private func willEnterForeground(){
        setUI()
    }
}
