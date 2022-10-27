//
//  BossViewBGView.swift
//  FJP
//
//  Created by K on 2022/10/27.
//

import UIKit

class BossViewBGView: UIView {
    var bgView :UIView = UIView();

    convenience init(frame: CGRect,zr:[ZR]) {
        self.init(frame: frame);
        let b = BoSSBGBGView();
        self .addSubview(b);
        for i  in 0..<zr.count
        {
            
            let bb = BossView(zr: zr[i]);
            b.addSubview(bb);
     
        }
        self.bgView = b;


    }
    
    
    
    func bossRandomKouxue(comp:  @escaping (() -> Void))
    {
      
        let jj =    self.bgView.subviews.shuffled().suffix(1).first as! BossView;
        var b =  Int.random(in: 20..<26);
        
    
        jj.lastValue = Int(jj.zr.shengming);
        jj.zr.shengming = Int16(Int(jj.zr.shengming) - b);
        jj.kouxue(zr: jj.zr);
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            comp();
        }
            

    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.bgView.frame = self.bounds;
        var maxColos = 1
        var W = 1078.rpx;
        var H = 1015.rpx;
        var xmari = 0.rpx;
        var ymari = 0 ;
        var buttonStartX = 0;
        var buttonStartY = 0.rpx;
        

        for i in 0..<self.bgView.subviews.count
        {
            let image = self.bgView.subviews[i];
 
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
      
        }
    }
    

}
