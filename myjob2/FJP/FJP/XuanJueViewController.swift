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
            make.height.equalTo(1700.rpx);
            make.leading.equalTo(100.rpx);
            make.top.equalTo(400.rpx);
        }
    }
    @IBAction func cccccc(_ sender: UIButton)
    {
        
        self.bb.isSelected = false;
        sender.isSelected = true;
        self.bb = sender;
    }
    
    @IBAction func ccccccffff(_ sender: UIButton)
    {
//        self.bb.tag
        let s = setupData()[sender.tag];
        s.select = true;
        appDelegate.saveContext();
    }
    


}
