//
//  BaseVC.swift
//  FJP
//
//  Created by K on 2022/10/25.
//

import UIKit

class BaseVC: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
            let bt1 =   UIButton();
            view.addSubview(bt1);
            bt1.setBackgroundImage(UIImage(named: "3主界面_金币框"), for: .normal);
        let p = getPlayData()!;
        bt1.setTitle("\(p.coin)", for: .normal);
        self.view.addSubview(bt1);
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(387.rpx);
                make.height.equalTo(87.rpx);
                make.trailing.equalTo(-600.rpx);
                make.top.equalTo(130.rpx);
            }
        
        
        let zhansdouli = UILabel();
        zhansdouli.text = "100";
        zhansdouli.font = UIFont.systemFont(ofSize: 24);
        zhansdouli.textColor = UIColor(red: 247/255.0, green: 206.0/255.0, blue: 22/255.0, alpha: 1);
        self.view.addSubview(zhansdouli);
        zhansdouli.snp.remakeConstraints { make in
            make.width.equalTo(100);
            make.height.equalTo(100.rpx);
            make.top.equalTo(220.rpx);
            make.leading.equalTo(500.rpx);
        }
            
            let zuanshi =   UIButton();
            zuanshi.setBackgroundImage(UIImage(named: "3主界面_钻石框"), for: .normal)
            zuanshi.setTitle("\(p.zuanshi)", for: .normal);
            view.addSubview(zuanshi);
            zuanshi.snp.remakeConstraints { make in
                make.width.equalTo(411.rpx);
                make.height.equalTo(87.rpx);
                make.trailing.equalTo(-100.rpx);
                make.top.equalTo(130.rpx);
            }
            
     
        NotificationCenter.default.addObserver(forName: Notification.Name(jinbiupdate), object: nil, queue: nil) { f in
            let p = getPlayData()!;
            bt1.setTitle("\(p.coin)", for: .normal);
            zuanshi.setTitle("\(p.zuanshi)", for: .normal);

        }
        

    }
  

}
