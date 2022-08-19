//
//  NearByVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/5/30.
//

import UIKit
import XLPagerTabStrip

class NearByVC: UIViewController ,IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: NSLocalizedString("NearBy", comment: "附近"));
    }


}
