//
//  HomeViewController.swift
//  LittlePrink
//
//  Created by Kratos on 2022/5/30.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        settings.style.selectedBarBackgroundColor = mainColor;
        settings.style.selectedBarHeight = 3;
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .label;
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16);
        settings.style.buttonBarItemLeftRightMargin = 0;
        
        super.viewDidLoad();
        containerView.bounces = false;
        
        changeCurrentIndexProgressive = { (oldcell:ButtonBarViewCell?,newCell:ButtonBarViewCell?,progressPercentag:CGFloat,changeCurrentIndex:Bool,animate:Bool) ->Void in
            guard changeCurrentIndex == true else {return}
            oldcell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
            
        }

        // Do any additional setup after loading the view.
    }
    

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
      
       let fllowVC =  storyboard!.instantiateViewController(withIdentifier: kFollowVCID);
        let discoveryVC =  storyboard!.instantiateViewController(withIdentifier: kDiscoveryVCID);
        let nearByVC =  storyboard!.instantiateViewController(withIdentifier: kNearByVCID);
        
        return  [discoveryVC,fllowVC,nearByVC];
    }
    
}
