//
//  DarkModeTableVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/9/4.
//

import UIKit

class DarkModeTableVC: UITableViewController {

    @IBOutlet weak var followSystemSwitch: UISwitch!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    var userInterFaceStyle: UIUserInterfaceStyle{
        traitCollection.userInterfaceStyle;

    }
    override func viewDidLoad()
    {
        super.viewDidLoad();
        darkModeSwitch.isOn = userInterFaceStyle == .dark;
        followSystemSwitch.isOn = UserDefaults.standard.integer(forKey: kuserinterfaceStyle) == 0;
    }


 
    @IBAction func toggle(_ sender: Any)
    {
        followSystemSwitch .setOn(false, animated: true);
        view.window?.overrideUserInterfaceStyle = darkModeSwitch.isOn ? .dark : .light;
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        if followSystemSwitch.isOn{
            UserDefaults.standard.set(0, forKey: kuserinterfaceStyle);
        }else
        {
            UserDefaults.standard.set(darkModeSwitch.isOn ? 2 : 1, forKey: kuserinterfaceStyle);
        }
    }
    private func setUserInterfaceStyle(){
        view.window?.overrideUserInterfaceStyle = darkModeSwitch.isOn ? .dark : .light;
    }
    
   
    @IBAction func followSystem(_ sender: Any) {
        if followSystemSwitch.isOn{
            view.window?.overrideUserInterfaceStyle = .unspecified;
            darkModeSwitch.setOn(userInterFaceStyle == .dark, animated: true);
        }else{
            view.window?.overrideUserInterfaceStyle =  darkModeSwitch.isOn ? .dark : .light;
        }
    }
}
