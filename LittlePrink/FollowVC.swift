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

        // Do any additional setup after loading the view.
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: NSLocalizedString("Follow", comment: "关注"));
    }
    

    
}
