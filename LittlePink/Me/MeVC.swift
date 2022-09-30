//
//  MeVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/7.
//

import UIKit
import LeanCloud

class MeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //iOS14之前去掉返回按钮文本的话需:
        //1.sb上:上一个vc(MeVC)的navigationitem中修改为空格字符串串
        //2.代码:上一个vc(此页)navigationItem.backButtonTitle = ""
        navigationItem.backButtonDisplayMode = .minimal
    }

    //退出登录(演示)
    @IBAction func logoutTest(_ sender: Any) {
        LCUser.logOut()
        
        let loginVC = storyboard!.instantiateViewController(identifier: kLoginVCID)
        
        loginAndMeParentVC.removeChildren()
        loginAndMeParentVC.add(child: loginVC)
        
    }
    @IBAction func showDraftNotes(_ sender: Any) {
        let navi = storyboard!.instantiateViewController(identifier: kDraftNotesNaviID)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true)
    }
}
