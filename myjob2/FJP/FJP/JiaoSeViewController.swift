//
//  JiaoSeViewController.swift
//  FJP
//
//  Created by K on 2022/10/26.
//

import UIKit

class JiaoSeViewDetailController: UIViewController
{
    
    var zb:ZB?
    override func viewDidLoad() {
        super.viewDidLoad();
        ///
        {
            let imageview = UIImageView();
            imageview.isUserInteractionEnabled = true;
            imageview.image = UIImage(named: "7角色_弹窗_t");
            self.view.addSubview(imageview);
            imageview.frame = self.view.bounds;
        }();
        ///
            let imageview = UIImageView();
        imageview.isUserInteractionEnabled = true;
            imageview.image = UIImage(named: "7角色_弹窗_提示");
            self.view.addSubview(imageview);
            imageview.snp.remakeConstraints { make in
                make.width.equalTo(1226.rpx);
                make.height.equalTo(1137.rpx);
                make.center.equalToSuperview();
            }
        
        
            let imagevie1w = UIImageView();
            imagevie1w.isUserInteractionEnabled = true;
        
            imagevie1w.image = UIImage(named: self.zb!.jiaoSe_XiangqingbgimageView!);
            self.view.addSubview(imagevie1w);
            imagevie1w.snp.remakeConstraints { make in
                make.width.equalTo(290.rpx);
                make.height.equalTo(288.rpx);
                make.center.equalToSuperview();
            }
        ///
        {
            
            let bt1 =   UIButton();
            bt1.setImage(UIImage(named: "7角色_弹窗_按钮"), for: .normal)
            imageview.addSubview(bt1);
            bt1.addTarget(self, action: #selector(quxiao(cccc:)), for: .touchUpInside);
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(440.rpx);
                make.height.equalTo(135.rpx);
                make.leading.equalTo(135.rpx);
                make.bottom.equalTo(-150.rpx);
            }
        }();
        
        {
            
            let bt1 =   UIButton();
            bt1.setImage(UIImage(named: "7角色_弹窗_按钮 拷贝"), for: .normal)
            imageview.addSubview(bt1);
            
            if self.zb?.xuanzhong == true
            {
                bt1.setImage(UIImage(named: "7角色_弹窗_按钮拷贝(2)"), for: .normal)

            }else
            {
                bt1.setImage(UIImage(named: "7角色_弹窗_按钮 拷贝"), for: .normal)

            }
            bt1.addTarget(self, action: #selector(queding(cccc:)), for: .touchUpInside);
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(440.rpx);
                make.height.equalTo(135.rpx);
                make.trailing.equalTo(-135.rpx);
                make.bottom.equalTo(-150.rpx);
            }
        }();

    }
    
    @objc func quxiao(cccc:UIButton){
        dismiss(animated: false);
    }
    
    @objc func queding(cccc:UIButton){
        self.zb?.xuanzhong =  !self.zb!.xuanzhong;
        appDelegate.saveContext();
        dismiss(animated: false);
        NotificationCenter.default.post(name: Notification.Name("JiaoSeViewshuaxinui"), object: nil);
    }
    
}


class JiaoSeViewController: BaseVC
{

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var guanbi: UIButton!
    @IBOutlet weak var imageSS: UIImageView!
    @IBOutlet weak var kong2: UIButton!
    @IBOutlet weak var kong1: UIButton!
    @IBOutlet weak var kong0: UIButton!
    var zhuangbeiBtn = [UIButton]();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.guanbi.snp.remakeConstraints { make in
            make.width.equalTo(239.rpx);
            make.height.equalTo(178.rpx);
            make.trailing.equalTo(0);
            make.top.equalTo(200.rpx);
        }
        self.imageSS.snp.remakeConstraints { make in
            make.width.equalTo(664.rpx);
            make.height.equalTo(1278.rpx);
            make.trailing.equalTo(-100.rpx);
            make.centerY.equalToSuperview().offset(100.rpx);

        }
        self.stackView.snp.remakeConstraints { make in
            make.width.equalTo(1300.rpx);
            make.height.equalTo(344.rpx);
            make.centerX.equalToSuperview().offset(200.rpx);
            make.bottom.equalTo(0.rpx);
        }
        
        self.kong0.snp.remakeConstraints { make in
            make.width.equalTo(368.rpx);
            make.height.equalTo(344.rpx);
            make.leading.equalTo(200.rpx);
            make.top.equalTo(700.rpx);
        }
        
        self.kong1.snp.remakeConstraints { make in
            make.width.equalTo(368.rpx);
            make.height.equalTo(344.rpx);
            make.leading.equalTo(self.kong0.snp.leading).offset(200.rpx);
            make.top.equalTo(900.rpx);
        }
        
        self.kong2.snp.remakeConstraints { make in
            make.width.equalTo(368.rpx);
            make.height.equalTo(344.rpx);
            make.leading.equalTo(self.kong0.snp.leading).offset(-10.rpx);
            make.top.equalTo(1110.rpx);
        }
        NotificationCenter.default.removeObserver(self);
        NotificationCenter.default.addObserver(forName: Notification.Name("JiaoSeViewshuaxinui"), object: nil, queue: nil) { f in
            self.shuaxinUI();
            
        }
    }
    
    @IBAction func guanbiS(_ sender: UIButton)
    {
        dismiss(animated: false);
    }
    @IBAction func kongclick(_ sender: UIButton) {
        if sender.tag == 0
        {
            let zb = getZB();
            let vvv =  JiaoSeViewDetailController();
            vvv.modalTransitionStyle = .crossDissolve;
            vvv.modalPresentationStyle = .custom;
            
            vvv.zb = zb[0];
            self.present(vvv, animated: false);
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
    }
    
    @objc func shuaxinUI()
    {
        let zb = getZB()[0];
        self.zhuangbeiBtn.map { b in
            b.removeFromSuperview();
        }
        if  zb.xuanzhong == true
        {
          
                
                let bt1 =   UIButton();
            bt1.tag = 0;
            bt1.setBackgroundImage(UIImage(named: zb.bgImageView!), for: .normal)
                view.addSubview(bt1);
            bt1.addTarget(self, action: #selector(kongclick(_:)), for: .touchUpInside);
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(368.rpx);
                make.height.equalTo(344.rpx);
                make.leading.equalTo(200.rpx);
                make.top.equalTo(700.rpx);
            }
            self.imageSS.image = UIImage(named: "7角色_属性_2");
            self.zhuangbeiBtn.append(bt1);
            
        }else
        {
            self.imageSS.image = UIImage(named: "7角色_属性");

        }
        
    }
    

}
