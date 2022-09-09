//
//  DiscoveryVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/5/30.
//

import UIKit
import XLPagerTabStrip

class DiscoveryVC: ButtonBarPagerTabStripViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        settings.style.selectedBarHeight = 0;
        settings.style.buttonBarItemBackgroundColor = .clear;
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14);
        super.viewDidLoad()
        containerView.bounces = false;
        changeCurrentIndexProgressive = {(oldCell:ButtonBarViewCell?,newCell:ButtonBarViewCell?,progressPercentage:CGFloat,changeCurrentIndex:Bool,animated:Bool)->Void
             in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .secondaryLabel;
            newCell?.label.textColor = .label;
        }

        // Do any additional setup after loading the view.
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        
        var vcs : [UIViewController] = [];
        for channel in kchannels
        {
            let vc =  storyboard!.instantiateViewController(withIdentifier: kWaterfallVCID) as! WaterfallVC;
            vc.channel = channel;
            vcs.append(vc);
            
        }
    
         
        return  vcs;
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: NSLocalizedString("Discovery", comment: "发现"));
    }
    

}
