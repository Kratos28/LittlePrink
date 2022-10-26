//
//  ZhaoHuanVC.swift
//  FJP
//
//  Created by K on 2022/10/26.
//

import UIKit

class ZhaoHuanVC: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.stackView.snp.remakeConstraints { make in
            make.width.equalTo(1000.rpx);
            make.height.equalTo(223.rpx);
            
            make.centerX.equalToSuperview();
            make.bottom.equalTo(-200.rpx);
        }
        {
            
            let bt1 =   UIButton();
            bt1.addTarget(self, action: #selector(guanbi), for: .touchUpInside);
            bt1.setBackgroundImage(UIImage(named: "8召唤_x拷贝"), for: .normal)
            view.addSubview(bt1);
            bt1.snp.remakeConstraints { make in
                make.width.equalTo(102.rpx);
                make.height.equalTo(77.rpx);
                make.trailing.equalTo(-100.rpx);
                make.top.equalTo(200
                    .rpx);
            }
        }();
    }
    

  @objc  func guanbi()
    {
        dismiss(animated: false);
    }
 
    @IBAction func zhaohuanyiciclick(_ sender: Any) {
        let vc = UIAlertController(title: "", message: "不足260金币", preferredStyle: .alert);
        let v = UIAlertAction(title: "ok", style: .cancel);
        vc.addAction(v);
        self.present(vc, animated: false);
    }
    
    @IBAction func zhaohuan10ci(_ sender: Any) {
        let vc = UIAlertController(title: "", message: "不足1999金币", preferredStyle: .alert);
        let v = UIAlertAction(title: "ok", style: .cancel);
        vc.addAction(v);
        self.present(vc, animated: false);
    }
}
