//
//  ShangdianViewController.swift
//  FJP
//
//  Created by K on 2022/10/25.
//

import UIKit

class ShangdianDeatil : UIViewController
{
    var imageView:UIImageView = UIImageView();
    var context: [String:Any] =  [String:Any]()
    {
        didSet
        {
            self.imageView.image = UIImage(named:context["bgimageView"]as! String);
        }
    }
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad();
        {
            let imageview = UIImageView();
            imageview.isUserInteractionEnabled = true;
            imageview.image = UIImage(named: "5商店_购买弹窗_slices_暗色");
            self.view.addSubview(imageview);
            imageview.frame = self.view.bounds;
        }();
        
            let cnetimage = UIImageView();
        cnetimage.isUserInteractionEnabled = true;
            cnetimage.image = UIImage(named: "5商店_购买弹窗_slices_bei");
            self.view.addSubview(cnetimage);
            cnetimage.frame = self.view.bounds;
            cnetimage.snp.remakeConstraints { make in
                make.center.equalToSuperview();
                make.width.equalTo(1226.rpx);
                make.height.equalTo(1137.rpx);
            }
            cnetimage.addSubview(self.imageView);

            
        
        
        self.imageView.snp.remakeConstraints { make in
            make.centerX.equalToSuperview();
            make.top.equalTo(250.rpx);
            make.width.equalTo(346.rpx);
            make.height.equalTo(442.rpx);
        }
            
            let queding =   UIButton();
            queding.setBackgroundImage(UIImage(named: "5商店_购买弹窗_slices_按 拷贝 3"), for: .normal)
            cnetimage.addSubview(queding);
            queding.addTarget(self, action: #selector(create(fff:)), for: .touchUpInside);
        queding.snp.remakeConstraints { make in
            make.width.equalTo(371.rpx);
            make.height.equalTo(115.rpx);
            make.leading.equalTo(200.rpx);
            make.bottom.equalTo(-100.rpx);
            
        }
        
        let quxiao =   UIButton();
        quxiao.setBackgroundImage(UIImage(named: "5商店_购买弹窗_slices_按 拷贝 2"), for: .normal)
        cnetimage.addSubview(quxiao);
        quxiao.addTarget(self, action: #selector(quxiao(fff:)), for: .touchUpInside);
        quxiao.snp.remakeConstraints { make in
            make.width.equalTo(371.rpx);
            make.height.equalTo(115.rpx);
            make.trailing.equalTo(-200.rpx);
            make.bottom.equalTo(-100.rpx);
        }
    }
    @objc func create(fff:UIButton)
    {
        
        let p = getPlayData()!;
        if self.context["jinbi"] as! Bool == true{
            
            if  Int16(self.context["coin"] as! Int) > p.coin
            {
                let vc = UIAlertController(title: "", message: "金币不足", preferredStyle: .alert);
                let v = UIAlertAction(title: "ok", style: .cancel);
                vc.addAction(v);
                self.present(vc, animated: false);
                return;
            }

            p.coin =  p.coin - Int16(self.context["coin"] as! Int)
            
        }else
        {
            
            if  Int16(self.context["coin"] as! Int) > p.zuanshi
            {
                let vc = UIAlertController(title: "", message: "钻石不足", preferredStyle: .alert);
                let v = UIAlertAction(title: "ok", style: .cancel);
                vc.addAction(v);
                self.present(vc, animated: false);
                return;
            }
            
            p.zuanshi =  p.zuanshi - Int16(self.context["coin"] as! Int)

        }
        
        
        appDelegate.saveContext();
        NotificationCenter.default.post(name: Notification.Name(jinbiupdate), object: nil);
    }
    @objc func quxiao(fff:UIButton)
    {
        dismiss(animated: false);
    }
}

class ShangdianViewController: BaseVC
{
    var context: Any?
    
    
    @IBOutlet weak var guanbibb: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.guanbibb.snp.remakeConstraints { make in
            make.width.equalTo(102.rpx);
            make.height.equalTo(77.rpx);
            make.top.equalTo(200.rpx);
            make.trailing.equalTo(-100.rpx);
        }
        
        var maxColos = 3;
        var W = 346.rpx;
        var H = 442.rpx;
        var xmari = 100.rpx;
        var ymari = 200.rpx ;
        var buttonStartX = 400.rpx;
        var buttonStartY = 800.rpx;
       let ff =  [
        ["bgimageView":"5商店_9","coin":800,"jinbi":true],
            ["bgimageView":"5商店_8","coin":800,"jinbi":false],
            ["bgimageView":"5商店_7","coin":800,"jinbi":false],
            ["bgimageView":"5商店_6","coin":800,"jinbi":false],
            ["bgimageView":"5商店_5","coin":1200,"jinbi":false],
            ["bgimageView":"5商店_4","coin":1200,"jinbi":false],
            ["bgimageView":"5商店_3","coin":2000,"jinbi":false],
            ["bgimageView":"5商店_2","coin":3000,"jinbi":false],
            ["bgimageView":"5商店_1","coin":3000,"jinbi":false],
        ]
        for i in 0..<ff.count
        {
            let image = UIButton();
            let arr =  ff[i];
            image.tag = i;
            
            image.setBackgroundImage(UIImage(named: arr["bgimageView"]as! String), for: .normal);
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
            image.addTarget(self, action: #selector(ssssss(sss:)), for: .touchUpInside);
            image.context = arr;
            self.view.addSubview(image);
        }
    }
    
    
    @objc func ssssss(sss:UIButton)
    {
        let ff = ShangdianDeatil();
        ff.modalTransitionStyle = .crossDissolve;
        ff.modalPresentationStyle = .custom;
        self.present(ff, animated: false);
        ff.context = sss.context as! [String:Any]
    }
    @IBAction func guanbiclickck(_ sender: UIButton) {
        self.dismiss(animated: false);
    }
    

}
