//
//  BAGVC.swift
//  FJP
//
//  Created by K on 2022/10/26.
//

import UIKit

class BAGVC: UIViewController {

    @IBOutlet weak var bgImagView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
            let bt1 =   UIButton();
            bt1.setImage(UIImage(named: "11背包_x 拷贝 2"), for: .normal)
            view.addSubview(bt1);
        bt1.addTarget(self, action: #selector(guanbiClick), for: .touchUpInside);
        bt1.snp.remakeConstraints { make in
            make.width.equalTo(102.rpx);
            make.height.equalTo(77.rpx);
            make.top.equalTo(400.rpx);
            make.trailing.equalTo(-300.rpx);
            
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
        
        
        let zb = getZB();
        
        for (i,v1) in zb.enumerated()
        {
            let image = UIButton();
            image.setBackgroundImage(UIImage(named: v1.jiaoSe_XiangqingbgimageView!), for: .normal);
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
            self.bgImagView.addSubview(image);
        }
        
        
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
