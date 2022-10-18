//
//  ViewController.swift
//  myjob01
//
//  Created by Kratos on 2022/10/13.
//

import UIKit
import SwiftyFitsize
import SnapKit
class ViewController: UIViewController {

    @IBOutlet weak var kaishi: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let xff =  550.0.rpx;
        let xff1 =   2200.0.rpx;
        
        
        
//        SwiftyFitsize.reference(
//          width: 428.0,
//          height: 926.0,
//          isIPhoneXSeriesHeight: true,
//          iPadFitMultiple: 0.67
//
//        )

        
        
        let f  = UIScreen.main.bounds.width;
        print(f);
        print(xff);
        print(xff1);
//        SwiftyFitsize.reference(width: 1024, iPadFitMultiple: 1)
//        SwiftyFitsize.reference(width: 1024, height: 768, isIPhoneXSeriesHeight: false, iPadFitMultiple: 0.7, calcResultType: .raw);
//        self.kaishi.frame = CGRect(x: xff, y: xff1, width: 910.rpx, height: 270.rpx);
//        self.kaishi.frame = CGRect(x: 350, y: 1200, width: 300, height: 100)~
//        let redViewFrame = CGRect(
//            x: 70,
//            y: 750,
//            width: 300,
//            height: 100)
//        kaishi.frame = redViewFrame~
        self.kaishi.snp.remakeConstraints { make in
            make.width.equalTo(910.rpx);
            make.height.equalTo(270.rpx);
            make.centerX.equalToSuperview();
            make.bottom.equalTo(-50~);
            
        }
    }


}

