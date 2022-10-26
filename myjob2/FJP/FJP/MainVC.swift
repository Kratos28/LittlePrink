//
//  MainVC.swift
//  FJP
//
//  Created by K on 2022/10/25.
//

import UIKit

class MainVC: BaseVC {

    @IBOutlet weak var bgimaveiw: UIImageView!
    @IBOutlet weak var zhandouli: UILabel!
    @IBOutlet weak var xiabian: UIStackView!
    @IBOutlet weak var youbian: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad();

        let p  = getPlayData()!;
        self.bgimaveiw.image = UIImage(named: p.renwuImanname!);
        
        self.youbian.snp.remakeConstraints { make in
            make.width.equalTo(296.rpx);
            make.height.equalTo(1000.rpx);
            make.trailing.equalTo(-100.rpx);
            make.top.equalTo(500.rpx);
        }
        
        self.xiabian.snp.remakeConstraints { make in
            make.trailing.equalTo(0.rpx);
            make.height.equalTo(312.rpx);
            make.leading.equalTo(0.rpx);
            make.bottom.equalTo(-100.rpx);
        }
        
   
    }
    


}
