//
//  FollowVC.swift
//  LittlePink
//
//  Created by 刘军 on 2020/11/7.
//

import UIKit
import XLPagerTabStrip

class FollowVC: UIViewController, IndicatorInfoProvider {
    override func viewDidLoad() {
        super.viewDidLoad()
//        let btn = ColorBtn(frame: CGRect(x: 100, y: 100, width: 100, height: 100), color: .green)
//        view.addSubview(btn)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: NSLocalizedString("Follow", comment: "首页上方的关注标签"))
    }


}

// MARK: - 子类里的初始化构造器
//1.子类没有'无初始值的自有属性'时,直接重写父类的init--见CVCell

class ColorBtn: UIButton{
    var color: UIColor
    
    //2.子类有'无初始值的自有属性'时,需定义自己的init,在这个init里面先给自己的属性赋值,再super.init
    init(frame: CGRect, color: UIColor){
        self.color = color
        super.init(frame: frame)
        backgroundColor = color
    }
    //3.若对象是从IB中创建的,则走required init?(coder: NSCoder)构造器
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
