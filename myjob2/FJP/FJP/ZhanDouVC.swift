//
//  ZhanDouVC.swift
//  FJP
//
//  Created by K on 2022/10/27.
//

import UIKit

class ZhanDouVC: UIViewController {
     var bgView: BGBGVIew?
    var bossBGView: BossViewBGView?

    @IBOutlet weak var fanhui: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
        self.fanhui.snp.remakeConstraints { make in
            make.width.equalTo(232.rpx);
            make.height.equalTo(207.rpx);
            make.top.equalTo(0.rpx);
            make.trailing.equalTo(0.rpx);
        }
        
        
        {
            let imageview = UIImageView();
            imageview.image = UIImage(named: "9战斗_855");
            self.view.addSubview(imageview);
            self.view.insertSubview(imageview, at: 1);
            
            imageview.snp.remakeConstraints { make in
                make.width.equalTo(1054.rpx);
                make.height.equalTo(1762.rpx);
                make.leading.equalTo(0.rpx);
                make.bottom.equalTo(0);
            }
        }();
        

        let kaipai = getKaipai();
        let f = BGBGVIew(frame: CGRect.zero, kai: kaipai, shifoudiren: false);
        self.view.addSubview(f);
        f.snp.remakeConstraints { make in
            make.width.equalTo(1450.rpx);
            make.height.equalTo(526.rpx);
            make.trailing.equalTo(-100.rpx);
            make.bottom.equalTo(-400.rpx);
        }
        self.bgView = f;

        let zr = getZR();
        self.bossBGView = BossViewBGView(frame: CGRect.zero, zr: zr);
        self.bossBGView?.backgroundColor = UIColor.red;
        self.view.addSubview(self.bossBGView!);
        self.bossBGView?.snp.remakeConstraints({ make in
            make.width.equalTo(1078.rpx);
            make.height.equalTo(1015.rpx);
            make.top.equalTo(100.rpx);
            make.trailing.equalTo(-200.rpx);
        })
        
        NotificationCenter.default.addObserver(forName: Notification.Name(gongji), object: nil, queue: nil) { f in
            let jineng = f.object as! jinengView;
            switch jineng.jineng!.index {
            case 0:
                
                let vc =  self.children[0] as! XuetiaoVC;
                jineng.jineng?.time = Date().timestamp;

                if vc.lantiaolast == 100
                {
                    let  lantiao = vc.lantiao.progress + Float(25);
                    vc.lantiaolast = Int(lantiao);
                    vc.lantiao .setProgress(0, animated: true);
                    jineng.isEnabled = false

                }
          
                break;
            case 1:
                
                
                self.bossBGView?.bossRandomKouxue {
                    
                }
                
                break;
            case 2:
                
                jineng.isEnabled = false
                jineng.jineng?.time = Date().timestamp;
                let vc =  self.children[0] as! XuetiaoVC;
                let  jiaxue = vc.xuetiao.progress + Float(5);
//
                vc.xuetiaolast = Int(jiaxue);
                vc.xuetiao .setProgress(jiaxue, animated: true);

                break;
                
            case 3:
                jineng.isEnabled = false
                jineng.jineng?.time = Date().timestamp;

                let vc =  self.children[0] as! XuetiaoVC;
                let  lantiao = vc.lantiao.progress + Float(25);
                vc.lantiaolast = Int(lantiao);
                vc.lantiao .setProgress(lantiao, animated: true);
                if vc.lantiaolast == 100
                {
                    self.bgView?.baofa.isEnabled = true;
                    
                }
                break;
            default:
                break;
            }
            appDelegate.saveContext();

            
        }
        
        
    }
    

    

    @IBAction func closeClick(_ sender: Any) {
        let vc = UIAlertController(title: "", message: "确定逃跑?", preferredStyle: .alert);
        let v = UIAlertAction(title: "取消", style: .cancel);
        let v1 = UIAlertAction(title: "确定", style: .default) { f in
            self.dismiss(animated: false);
        };
        vc.addAction(v1);
        self.present(vc, animated: false);
    }
}
