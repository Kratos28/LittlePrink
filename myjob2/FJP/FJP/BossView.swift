//
//  BossView.swift
//  FJP
//
//  Created by K on 2022/10/27.
//

import UIKit

class BossView: UIView {
    var zr : ZR = ZR();
    var bgimage :UIImageView?
    var progressView : LinearProgressView =  LinearProgressView();
    var anminate:UIImageView?
    var kouxuelabel:UILabel = UILabel();
    var lastValue : Int?;

    convenience init(zr:ZR)
    {
        self.init(frame: CGRect.zero);
        self.zr = zr;
        let p = getPlayData();

       
       
        
        let bgimage = UIImageView(image: UIImage(named: zr.bossZhandouImage!));
        self.addSubview(bgimage);
        self.bgimage = bgimage;
        
        
       progressView =  LinearProgressView(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height));
        progressView.barColor = UIColor.black;
        progressView.trackColor = UIColor.green;
        progressView.setProgress(100, animated: true);
        self.addSubview(progressView);
     
        
        anminate = UIImageView()
        anminate!.image = UIImage(named: "kouxue_xueheng");
        anminate!.isHidden = true;

        self.addSubview(anminate!);
        

        
        self.kouxuelabel = UILabel();
        self.kouxuelabel.font = UIFont.systemFont(ofSize: 30);
        self.kouxuelabel.textColor = UIColor.yellow;
        self.kouxuelabel.textAlignment = .center;
        self.addSubview(self.kouxuelabel);
        
    }
    
    func kouxue(zr:ZR)
    {
        var value =  CGFloat(zr.shengming) / CGFloat(zr.zuidashengming);
        value = value * 100;
        let xue = Int(zr.shengming) - Int(self.lastValue!);
        self.progressView.setProgress(Float(value), animated: true);
        self.lastValue = zr.shengming as? Int
        
        
        let rect = self.frame
        UIView.animate(withDuration: 0.1) {
            self.frame = CGRect.init(x: rect.origin.x + 5, y: rect.origin.y + 5, width: rect.size.width, height: rect.size.height);
            self.anminate?.isHidden = false;
            self.kouxuelabel.isHidden = false;
            self.kouxuelabel.text = "\(xue)";
        } completion: { ff in
            self.frame = rect;
        }
        
        
        
        self.perform(#selector(animatehide), with: nil,afterDelay: 0.5)
        
        
        if Int(zr.shengming) <= 0
        {
            self.perform(#selector(dead), with: nil,afterDelay: 1)
        }
        
    }
    @objc func dead()
     {
         self.removeFromSuperview();
     }
     
    @objc func animatehide()
     {
         self.anminate?.isHidden = true;
         self.kouxuelabel.isHidden = true;

     }
    override func layoutSubviews()
    {
        super.layoutSubviews();
        self.progressView.frame = CGRect.init(x:  300.rpx, y:0.rpx, width:500.rpx, height: 40.rpx);
        self.bgimage?.frame = CGRect.init(x: 0, y: 0 , width:Int(self.frame.size.width), height: 1015.rpx);
        self.anminate?.frame = CGRect.init(x: Int(self.frame.size.width / 2) - Int(556.rpx / 2), y: Int(self.frame.size.height / 2) - Int(351.rpx / 2), width: Int(556.rpx), height: 351.rpx);
        self.kouxuelabel.frame = CGRect(x: 0, y: 0, width: Int(self.frame.size.width), height: 100.rpx);
    }
}
