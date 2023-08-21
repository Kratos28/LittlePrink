//
//  MeVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/7.
//

import UIKit
import LeanCloud
import SegementSlide
import SwiftUI
class MeVC: SegementSlideDefaultViewController {
    
    
    var user : LCUser
    var isFromNote = false;
    init?(coder:NSCoder,user:LCUser){
        self.user = user;
        super.init(coder: coder);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //iOS14之前去掉返回按钮文本的话需:
        //1.sb上:上一个vc(MeVC)的navigationitem中修改为空格字符串串
        //2.代码:上一个vc(此页)navigationItem.backButtonTitle = ""
        navigationItem.backButtonDisplayMode = .minimal
        setUI();
        defaultSelectedIndex = 0;
        reloadData();
    }
    
    
    override var bouncesType: BouncesType
    {
        return .child;
    }
    
    override func segementSlideHeaderView() -> UIView? {
        
        let headerView = Bundle.loadView(fromNib: "MeHeadView", with:MeHeaderView.self);

        headerView.translatesAutoresizingMaskIntoConstraints = false;
        headerView.heightAnchor.constraint(equalToConstant: headerView.rootStackView.frame.height  + 16).isActive =
        true;
        headerView.user = user;

        if isFromNote
        {
            headerView.backOrSlideBtn.setImage(largeIcon("chevron.left"), for: .normal);
            
        }
        headerView.backOrSlideBtn.addTarget(self, action: #selector(backOrDrawer), for: .touchUpInside);
        return headerView;
    }
    
    
    override var switcherConfig: SegementSlideDefaultSwitcherConfig
    {
        var config = self.switcherConfig;
        config.type = .tab;
        config.selectedTitleColor = .label;
        config.indicatorColor = mainColor;
        return config;
    }
    override var titlesInSwitcher: [String]
    {
        return ["笔记","收藏","赞过"]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        let vc = storyboard!.instantiateViewController(withIdentifier: kWaterfallVCID) as! WaterfallVC;
        return vc;
    }
    
    

//    //退出登录(演示)
//    @IBAction func logoutTest(_ sender: Any) {
//        LCUser.logOut()
//
//        let loginVC = storyboard!.instantiateViewController(identifier: kLoginVCID)
//
//        loginAndMeParentVC.removeChildren()
//        loginAndMeParentVC.add(child: loginVC)
//
//    }
//    @IBAction func showDraftNotes(_ sender: Any) {
//        let navi = storyboard!.instantiateViewController(identifier: kDraftNotesNaviID)
//        navi.modalPresentationStyle = .fullScreen
//        present(navi, animated: true)
//    }
}
