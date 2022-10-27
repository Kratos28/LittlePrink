//
//  BAGVC.swift
//  FJP
//
//  Created by K on 2022/10/26.
//

import UIKit

class BAGDeatailVC: UIViewController {
    var zb:ZB?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
             let bt1 =   UIButton();
             bt1.setImage(UIImage(named: "4充值_t"), for: .normal)
             view.addSubview(bt1);
         bt1.isUserInteractionEnabled = true;
         bt1.snp.remakeConstraints { make in
             make.leading.equalTo(0.rpx);
             make.bottom.equalTo(0);
             make.top.equalTo(0);
             make.trailing.equalTo(0);
             
         }
            
            let bag_detail =   UIImageView();
        bag_detail.isUserInteractionEnabled = true;
        bag_detail.image = UIImage(named: zb!.bag_detail!);
            view.addSubview(bag_detail);
        bag_detail.snp.remakeConstraints { make in
                make.width.equalTo(1226.rpx);
                make.height.equalTo(1137.rpx);
                make.center.equalToSuperview();
            }
            
        
        {
            let bt1 =   UIButton();
            bt1.setBackgroundImage(UIImage(named: "11背包_弹窗_按 拷贝 3"), for: .normal)
            bag_detail.addSubview(bt1);
            bt1.addTarget(self, action: #selector(chushou(ss:)), for: .touchUpInside);
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(371.rpx);
                make.height.equalTo(115.rpx);
                make.leading.equalTo(200.rpx);
                make.bottom.equalTo(-100.rpx);
            }
            
        }();
        
        {
            let bt1 =   UIButton();
            bt1.setBackgroundImage(UIImage(named: "11背包_弹窗_按 拷贝 2"), for: .normal)
            bag_detail.addSubview(bt1);
            bt1.addTarget(self, action: #selector(shengjiCLick(ss:)), for: .touchUpInside);

            bt1.snp.remakeConstraints { make in
                make.width.equalTo(371.rpx);
                make.height.equalTo(115.rpx);
                make.trailing.equalTo(-200.rpx);
                make.bottom.equalTo(-100.rpx);
            }
            
        }();
        
        
        
        {
            let bt1 =   UIButton();
            bt1.setBackgroundImage(UIImage(named: "11背包_弹窗_点击空白处继续"), for: .normal)
            view.addSubview(bt1);
            bt1.addTarget(self, action: #selector(guanbi(ss:)), for: .touchUpInside);

            bt1.snp.remakeConstraints { make in
                make.width.equalTo(460.rpx);
                make.height.equalTo(63.rpx);
                make.centerX.equalToSuperview();
                make.centerY.equalToSuperview().offset(700.rpx);

                
            }
            
        }();
        
        

    }
    
    
    @objc func guanbi(ss:UIButton)
    {
        self.dismiss(animated: false);
    }
    
    
    @objc func shengjiCLick(ss:UIButton)
    {
        let vc = UIAlertController(title: "", message: "金币不足5000", preferredStyle: .alert);
        let v = UIAlertAction(title: "ok", style: .cancel);
        vc.addAction(v);
        self.present(vc, animated: false);
    }
    
    @objc func chushou(ss:UIButton)
    {
        let vc = UIAlertController(title: "", message: "确定出售?", preferredStyle: .alert);
        let v = UIAlertAction(title: "ok", style: .default) { ff  in
            self.dismiss(animated: false);
            self.zb?.huoqu = false;
            let gg = getPlayData()!;
            gg.coin = gg.coin + 200;
            
            appDelegate.saveContext();
            NotificationCenter.default.post(name: Notification.Name(jinbiupdate), object: nil);
            
            

            
        }
        
        let quxiao = UIAlertAction(title: "取消", style: .cancel) { ff  in
          
            
        }

        vc.addAction(v);
        vc.addAction(quxiao);
        self.present(vc, animated: false);
    }
}

class BAGVC: UIViewController {

    @IBOutlet weak var bgImagView: UIImageView!
    var buttons = [UIButton]();
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
            let bt1 =   UIButton();
            bt1.setImage(UIImage(named: "11背包_x 拷贝 2"), for: .normal)
            view.addSubview(bt1);
        bt1.isUserInteractionEnabled = true;
        bt1.addTarget(self, action: #selector(guanbiClick), for: .touchUpInside);
        bt1.snp.remakeConstraints { make in
            make.width.equalTo(102.rpx);
            make.height.equalTo(77.rpx);
            make.top.equalTo(400.rpx);
            make.trailing.equalTo(-300.rpx);
            
        }
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name(jinbiupdate), object: nil, queue: nil) { ff in
            
            
            var maxColos = 3;
            var W = 185.rpx;
            var H = 184.rpx;
            var xmari = 150.rpx
            var ymari = 240.rpx;
            var buttonStartX = 600.rpx;
            var buttonStartY = 600.rpx
            
            var zb = getZB();
            self.buttons .map { b in
                b.removeFromSuperview();
            }
            
           zb =  zb.filter { b in
                if b.huoqu == true
                {
                    return true;
                }
                return false;
            }
        
            for (i,v1) in zb.enumerated()
            {
                let image = UIButton();
                image.tag = i;
                image.setBackgroundImage(UIImage(named: v1.jiaoSe_XiangqingbgimageView!), for: .normal);
                let row =  Int(i) / maxColos;
                let col = Int(i) % maxColos;
                let x = buttonStartX + col * (xmari + W);
                let y = buttonStartY + row * (ymari + H);
                image.frame = CGRect.init(x: x, y: y, width: W, height: H);
                image.addTarget(self, action: #selector(self.bagClick(sender:)), for: .touchUpInside);
                self.bgImagView.addSubview(image);
                self.buttons.append(image);
            }
        }
        
        var maxColos = 3;
        var W = 185.rpx;
        var H = 184.rpx;
        var xmari = 150.rpx
        var ymari = 240.rpx;
        var buttonStartX = 600.rpx;
        var buttonStartY = 600.rpx
        
     
        for i in 0..<9
        {
            let image = UIButton();
            image.setBackgroundImage(UIImage(named: "11背包_组"), for: .normal);
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
            self.bgImagView.addSubview(image);
        }
        
        
        var zb = getZB();
        self.buttons .map { b in
            b.removeFromSuperview();
        }
        
       zb =  zb.filter { b in
            if b.huoqu == true
            {
                return true;
            }
            return false;
        }
        for (i,v1) in zb.enumerated()
        {
            let image = UIButton();
            image.tag = i;
            image.setBackgroundImage(UIImage(named: v1.jiaoSe_XiangqingbgimageView!), for: .normal);
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
            image.addTarget(self, action: #selector(bagClick(sender:)), for: .touchUpInside);
            self.bgImagView.addSubview(image);
            self.buttons.append(image);
        }
        
        
    }
    
    @objc func bagClick(sender:UIButton)
    {
        let zb = getZB();
        let f1 = zb[sender.tag];
        let f = BAGDeatailVC();
        f.zb = f1;
        f.modalTransitionStyle = .crossDissolve;
        f.modalPresentationStyle = .custom;
        present(f, animated: false);
    }
    @objc func injected()
    {
        self.viewDidLoad();
    }
 
    @objc func guanbiClick()
    {
        self.dismiss(animated: false);
    }
}
