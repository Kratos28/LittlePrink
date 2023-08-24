//
//  MeVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/7.
//

import UIKit
import LeanCloud
import SegementSlide


class MeVC: SegementSlideDefaultViewController {
    
    var user : LCUser
    var isFromNote = false;
    var isMySelf =  false;
    
    init?(coder:NSCoder,user:LCUser){
        self.user = user;
        super.init(coder: coder);
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad();
        config();
        setUI();
    }
    
    
    override var bouncesType: BouncesType
    {
        return .child;
    }
    
    override func segementSlideHeaderView() -> UIView? {
        return setHeaderView();
     
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
        let hasDraft = ((index == 0) && isMySelf && UserDefaults.standard.integer(forKey: kDraftNoteCount) >  0)
        
        let vc = storyboard!.instantiateViewController(withIdentifier: kWaterfallVCID) as! WaterfallVC;
        vc.isMyDraft = hasDraft;
        vc.user = user;
        vc.isMyNote =  index == 0;
        vc.isMyFav = index == 1;
        vc.isMyselfLike = (isMySelf && index == 2)
        vc.isFromMeVC = true;
        vc.formMeVCUser =  user;
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
