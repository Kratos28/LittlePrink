//
//  NoticationTableVC.swift
//  LittlePink
//
//  Created by k on 2023/8/26.
//

import UIKit

class NotificationTableVC: UITableViewController {

    @IBOutlet weak var toggleAllowNotificationSwitch: UISwitch!
    var isNotDetermined = false;
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setUI();
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForegroud), name: UIApplication.willEnterForegroundNotification, object: nil);
    }
 

    @IBAction func toggleAllowNotification(_ sender: UISwitch)
    {
        if sender.isOn , isNotDetermined
        {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { granted, error in
                    if !granted
                    {
                        self.setSwitch(false);
                    }
                    

                }
                isNotDetermined = false;
            
            }else{
            jumpToSetting();
        }
        
    }
    
}

extension NotificationTableVC{
    private func setUI(){
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus
            {
                case . notDetermined:
                DispatchQueue.main.async {
                    self.setSwitch(false);
                    self.isNotDetermined = true;
                }
                case .denied:
                 self.setSwitch(false);
            default:
                self.setSwitch(true);
            }
        }
    }
    private func setSwitch(_ on :Bool){
        DispatchQueue.main.async {
            self.toggleAllowNotificationSwitch.setOn(on, animated: true);
            
        }
    }
    @objc private func willEnterForegroud(){
        setUI();
    }
}
