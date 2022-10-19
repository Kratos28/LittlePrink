//
//  SViewController.swift
//  myjob01
//
//  Created by Kratos on 2022/10/18.
//

import UIKit

class SViewController: UIViewController {

    @IBOutlet weak var kaishibbbb: UIButton!
    @IBOutlet weak var imageVIEW: UIImageView!
    var b = UIButton();
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stackView.snp.remakeConstraints { make in
            make.width.equalTo(1200.rpx);
            make.height.equalTo(300.rpx);
            make.bottom.equalTo(-100.rpx);
            make.centerX.equalToSuperview();
            
        }
        let ss =  stackView.subviews.first as! UIButton;
        self.imageVIEW.image = UIImage(named: "2选角色1_slices_组 9");
        self.bbf(ss);
        kaishibbbb.snp.remakeConstraints { make in
            make.width.equalTo(850.rpx);
            make.height.equalTo(260.rpx);
            make.bottom.equalTo(-700
                .rpx);
            make.trailing.equalTo(-100.rpx);
            
        }
        
    }
    
    @IBAction func kaishiclick(_ sender: Any) {
    }
    
    @IBAction func bbf(_ sender: UIButton) {
        self.b.isSelected = false;
        sender.isSelected = true;
        self.b = sender;
        switch sender.tag {
        case 0:
            self.imageVIEW.image = UIImage(named: "2选角色1_slices_组 9");

            break;
        case 1:
            self.imageVIEW.image = UIImage(named: "2选角色1_slices_组 8");

            break;
        case 2:
            self.imageVIEW.image = UIImage(named: "2选角色1_slices_组 7");
            break;

        default:
            break;
        }
        

    }
    
}
