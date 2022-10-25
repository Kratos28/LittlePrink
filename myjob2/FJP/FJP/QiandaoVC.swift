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
        
    
   
        for i in 0..<6
        {
            let image = UIButton();
            image.setBackgroundImage(UIImage(named: "6签到_框拷贝"), for: .normal);
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
//            image.addTarget(self, action: #selector(ffff(sender:)), for: .touchUpInside);
            self.bgImageView.addSubview(image);
        }
        
        
        
    }
    
    

}
