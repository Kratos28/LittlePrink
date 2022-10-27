//
//  XuetiaoVC.swift
//  FJP
//
//  Created by K on 2022/10/27.
//

import UIKit

class XuetiaoVC: UIViewController {
    var xuetiaolast : Int = 0;
    var lantiaolast : Int = 0;
    @IBOutlet weak var lvc: UILabel!
    @IBOutlet weak var mingzi: UILabel!
    @IBOutlet weak var bgima: UIImageView!
    @IBOutlet weak var lantiao: LinearProgressView!
    @IBOutlet weak var xuetiao: LinearProgressView!
    override func viewDidLoad() {
        super.viewDidLoad();
        let p = getPlayData()!;
        self.bgima.image = UIImage(named: p.headViewImage!);
        self.mingzi.text = "艾薇尔";
        self.lvc.text = "LV.1"
        
    }
    
    deinit
    {
        print("XuetiaoVC释放");
        
    }



}
