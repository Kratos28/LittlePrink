//
//  DarkModeTableVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/20.
//

import UIKit

class DarkModeTableVC: UITableViewController {
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var followSystemSwitch: UISwitch!
    
    //当前App的深浅色模式
    var userInterfaceStyle: UIUserInterfaceStyle{ traitCollection.userInterfaceStyle }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        darkModeSwitch.isOn = userInterfaceStyle == .dark
        followSystemSwitch.isOn = UserDefaults.standard.integer(forKey: kUserInterfaceStyle) == 0
    }

    @IBAction func toggle(_ sender: Any){
        followSystemSwitch.setOn(false, animated: true)
        //设置App的深浅色模式
        setUserInterfaceStyle()
    }
    
    @IBAction func followSystem(_ sender: Any){
        if followSystemSwitch.isOn{
            view.window?.overrideUserInterfaceStyle = .unspecified
            darkModeSwitch.setOn(userInterfaceStyle == .dark, animated: true)
        }else{
            setUserInterfaceStyle()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //模仿UIUserInterfaceStyle枚举的rawvalue来设012进本地,用于跟随系统switch初始UI的判断和App打开后深浅色模式的判断
        if followSystemSwitch.isOn{
            UserDefaults.standard.set(0, forKey: kUserInterfaceStyle)
        }else{
            UserDefaults.standard.set(darkModeSwitch.isOn ? 2 : 1, forKey: kUserInterfaceStyle)
        }
    }
    
    private func setUserInterfaceStyle(){
        view.window?.overrideUserInterfaceStyle = darkModeSwitch.isOn ? .dark : .light
    }

}
