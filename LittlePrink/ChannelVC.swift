//
//  ChannelVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/16.
//

import UIKit
import XLPagerTabStrip



class ChannelVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.style.selectedBarHeight = 2;
        settings.style.selectedBarBackgroundColor = mainColor;
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
        var vcs: [UIViewController] = [];
        
        for i in kchannels.indices
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: kChannelTableVCID) as! ChannelTableVC
            vc.channel = kchannels[i];
            vc.subChannels = kAllSubChannels[i];
            vcs.append(vc);
            
        }
        return vcs
    }
    

}
