//
//  BGBGVIew.swift
//  FJP
//
//  Created by K on 2022/10/27.
//

import UIKit

class BGBGVIew: UIView {
    var timer  =  Timer();
    var zhubttns = [UIButton]();
    var baofa = jinengView();
    var b : UIView = UIView();
    convenience init(frame: CGRect,kai:[Kaipai],shifoudiren:Bool) {
        self.init(frame: frame);
        let b = UIView();
        self .addSubview(b);
        
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(lengque), userInfo: nil, repeats: true);

        self.b = b;
        for (i,kaipai)  in kai.enumerated()
        {
            
            let bb = jinengView(frame: CGRect.zero, kai: kaipai, shifoudiren: false);
            bb.tag = i;
            bb.addTarget(self, action: #selector(clickc(btn:)), for: .touchUpInside);
            b.addSubview(bb);
            self.zhubttns.append(bb);
            if i == 0
            {
                self.baofa = bb
                bb.isEnabled = false;
            }
          
        }
        self.timer.fire();
        
        
    }
    
    @objc func  clickc(btn:jinengView)
    {
        NotificationCenter.default.post(name: Notification.Name(gongji), object: btn);
    }
    
    @objc func lengque()
    {

        
        let ss = Date().timestamp;
        let s1 = getKaipai();
        for i  in  1..<s1.count
        {
            let vi1 = s1[i];
            let sss =  vi1.time!;
           let bbb =  compareCurrntTime(timeStamp: sss);
            if bbb == true
            {
                let ss =  self.zhubttns[i];
                ss.isEnabled = true;
            }
        }

        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.b.frame = self.bounds;
        let maxColos = 4;
        let W = 356.rpx;
        let H = 526.rpx;
        let xmari = 10.rpx;
        let ymari = 0 ;
        let buttonStartX = 0;
        let buttonStartY = 0;
        
        
   
 
        
      for (i,ww)  in self.b.subviews.enumerated()
       {
          let row =  Int(i) / maxColos;
          let col = Int(i) % maxColos;
          let x = buttonStartX + col * (xmari + W);
          let y = buttonStartY + row * (ymari + H);
            ww.frame = CGRect(x: x, y: y, width: W, height: H);
       }
    }
    func compareCurrntTime(timeStamp:String) ->Bool
   {
       //计算出时间戳距离现在时间的一个秒数(..s)
       let interval:TimeInterval=TimeInterval.init(timeStamp)!
       let date = Date(timeIntervalSince1970: interval)
       var timeInterval = date.timeIntervalSinceNow
       timeInterval = -timeInterval
       var result:String
       if timeInterval < 10 {
        result = "刚刚"

       return false
           
       }else if Int(timeInterval/60) < 60
       {
           result = String.init(format:"%@分钟前",String(Int(timeInterval/60)));
           return true
           
       }else if Int((timeInterval/60)/60) < 24{
               //一天以内
           result = String.init(format:"%@小时前",String(Int((timeInterval/60)/60)))
           return true
       }else{
               //超过一天的
       let dateformatter = DateFormatter()
           //自定义日期格式
           dateformatter.dateFormat="yyyy年MM月dd日 HH:mm"
           result = dateformatter.string(from: date as Date)
           return true
           
       }

   }
}
