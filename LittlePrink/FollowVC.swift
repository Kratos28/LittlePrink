//
//  FollowVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/5/30.
//

import UIKit
import XLPagerTabStrip

class FollowVC: UIViewController ,IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = ColorBtn(frame: CGRect(x: 50, y: 100, width: 100, height: 100), color: .green);
        view.addSubview(btn);
        
        // Do any additional setup after loading the view.
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: NSLocalizedString("Follow", comment: "关注"));
    }
    
    
    

    
}


class ColorBtn : UIButton
{
    var color : UIColor
    init(frame : CGRect ,color:UIColor)
    {
         self.color = color;
        
        super.init(frame: frame);
        backgroundColor = color;
    }
    required init?(coder: NSCoder) {
        
        fatalError("adfaf");
    }
}
