//
//  QiandaoVC.swift
//  FJP
//
//  Created by K on 2022/10/25.
//

import UIKit

class QiandaoVC: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var qiandaoV: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad();

        
        var maxColos = 3;
        var W = 373.rpx;
        var H = 366.rpx;
        var xmari = 50.rpx;
        var ymari = 50.rpx;
        var buttonStartX = 400.rpx;
        var buttonStartY = 550.rpx;
        
    
        let s = getSign();
        for i in 0..<s.count
        {
            let image = UIButton();
            let sg = s[i];
            
            image.setBackgroundImage(UIImage(named: sg.bgImageView!), for: .normal);
            
            
            
  
            
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
            image.addTarget(self, action: #selector(ffff(sender:)), for: .touchUpInside);
            self.bgImageView.addSubview(image);
            
            
            if sg.issign == true
            {
                
           
                
                let bt = UIButton();
                bt.setImage(UIImage(named: "6签到_框(1)"), for: .normal)
                image.addSubview(bt);
                bt.frame = image.bounds;
            
            let bt1 = UIButton();
                bt1.setImage(UIImage(named: "6签到_d3d2e7f06e07219316bc5658df7bf9c0d4bed6f51587-8Bf5Sb"), for: .normal)
                image.addSubview(bt1);
                bt1.frame = image.bounds;
          
            }
        }
        
        self.qiandaoV.snp.remakeConstraints { make in
            make.width.equalTo(102.rpx);
            make.height.equalTo(77.rpx);
            make.trailing.equalTo(-200.rpx);
            make.top.equalTo(200.rpx);
        }
        
        {
            
            let bt1 =   UIButton();
            bt1.setImage(UIImage(named: "6签到_框拷贝4"), for: .normal)
            view.addSubview(bt1);
        
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(1208.rpx);
                make.height.equalTo(377.rpx);
                make.centerY.equalToSuperview().offset(300.rpx);
                make.centerX.equalToSuperview();
            }
            
        }();
        
        {
            
            let bt1 =   UIButton();
            bt1.setImage(UIImage(named: "6签到_图层52拷贝"), for: .normal)
            view.addSubview(bt1);
        
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(1208.rpx);
                make.height.equalTo(377.rpx);
                make.centerY.equalToSuperview().offset(300.rpx);
                make.centerX.equalToSuperview();
            }
            
        }();
    }
    
    
    @IBAction func buttolclick(_ sender: UIButton) {
        self.dismiss(animated: false);
    }
    @objc func ffff(sender:UIButton)
    {
        
        
    
            
        let s = getSign()[sender.tag];
        if sender.tag == 0
        {
            if s.issign == false
            {
                
                let vc = UIAlertController(title: "", message: "签到成功", preferredStyle: .alert);
                let v = UIAlertAction(title: "ok", style: .cancel);
                vc.addAction(v);
                
                self.present(vc, animated: false);
                let bt = UIButton();
                bt.setImage(UIImage(named: "6签到_框(1)"), for: .normal)
                sender.addSubview(bt);
                bt.frame = sender.bounds;
            
            let bt1 = UIButton();
                bt1.setImage(UIImage(named: "6签到_d3d2e7f06e07219316bc5658df7bf9c0d4bed6f51587-8Bf5Sb"), for: .normal)
                sender.addSubview(bt1);
                bt1.frame = sender.bounds;
                s.issign = true;
                appDelegate.saveContext();
            }
        }else
        {
            let vc = UIAlertController(title: "", message: "请第二天来签到", preferredStyle: .alert);
            let v = UIAlertAction(title: "ok", style: .cancel);
            vc.addAction(v);
        }
    
        
    }
}
