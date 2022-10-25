//
//  XuanJueViewController.swift
//  FJP
//
//  Created by Kratos on 2022/10/20.
//

import UIKit
import SnapKit
class XuanJueViewController: UIViewController {

    
    @IBOutlet weak var imageVIew: UIImageView!
    var bb = UIButton();
    @IBOutlet weak var stacckc: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stacckc.snp.remakeConstraints { make in
            make.width.equalTo(400.rpx);
            make.height.equalTo(1500.rpx);
            make.leading.equalTo(100.rpx);
            make.top.equalTo(400.rpx);
        };
        
        self.cccccc(self.stacckc.subviews[0] as! UIButton);
        
        
    }
    @IBAction func cccccc(_ sender: UIButton)
    {
        
        self.bb.isSelected = false;
        sender.isSelected = true;
        self.bb = sender;
        
        switch sender.tag {
        case 0:
            self.imageVIew.image = UIImage(named: "2选择角色_背景4");
            break;
        case 1:
            self.imageVIew.image = UIImage(named: "2选择角色_图层6拷贝22");
            break;
        case 2:
            self.imageVIew.image = UIImage(named: "2选择角色_背景322");
            break;
        default:
            break;
        }
    }
    
    @IBAction func ccccccffff(_ sender: UIButton)
    {
//        self.bb.tag
        let s = setupData()[sender.tag];
        s.select = true;
        appDelegate.saveContext();
    }
    


}
