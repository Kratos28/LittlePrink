//
//  MainViewController.swift
//  myjob01
//
//  Created by Kratos on 2022/10/19.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var fulin: UIButton!
    
    @IBOutlet weak var trailningStatckView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    @IBOutlet weak var staciVIew: UIStackView!
    @IBOutlet weak var tianxia: UIButton!
    @IBOutlet weak var paiqian: UIButton!
    @IBOutlet weak var zhengzhan: UIButton!
    @IBOutlet weak var zhujiao: UIButton!
    @IBOutlet weak var baoguo: UIButton!
    @IBOutlet weak var qunxiongzhulu: UIButton!
    @IBOutlet weak var yangwu: UIButton!
    @IBOutlet weak var rengwu: UIButton!
    @IBOutlet weak var zhuangpang: UIButton!
    @IBOutlet weak var shangdian: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        self.bottomStackView.snp.remakeConstraints { make in
            make.height.equalTo(350.rpx);
            make.trailing.equalTo(0);
            make.leading.equalTo(0);
            make.bottom.equalTo(-100.rpx);
        }
        
        
        self.staciVIew.snp.remakeConstraints { make in
            make.width.equalTo(1000.rpx);
            make.trailing.equalTo(0.rpx);
            make.height.equalTo(350.rpx);
            make.top.equalTo(400.rpx);
        }
        
        
        self.trailningStatckView.snp.remakeConstraints { make in
            make.width.equalTo(310.rpx);
            make.trailing.equalTo(0);
            make.height.equalTo(1200.rpx);
            make.centerY.equalToSuperview();
        }
    }
}
