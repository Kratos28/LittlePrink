//
//  ZuanshiViewController.swift
//  FJP
//
//  Created by K on 2022/10/25.
//

import UIKit

class ZuanshiViewController: UIViewController {
    var array : Array<[String:AnyObject]>?

    @IBOutlet weak var guanbi: UIButton!
    @IBOutlet weak var bggggImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.guanbi.snp.remakeConstraints { make in
            make.width.equalTo(102.rpx);
            make.height.equalTo(77.rpx);
            make.top.equalTo(200.rpx);
            make.trailing.equalTo(-100.rpx);
        }
        
        var maxColos = 3;
        var W = 410.rpx;
        var H = 533.rpx;
        var xmari = 150.rpx;
        var ymari = 200.rpx;
        var buttonStartX = 300.rpx;
        var buttonStartY = 600.rpx;
        let f =  Bundle.main.path(forResource: "Recharge", ofType: "json")
        let data = try? Data.init(contentsOf: URL(fileURLWithPath: f!));
        let ff =   String.init(data: data!, encoding: String.Encoding.utf8)
        let jpwp = self.getDictionaryFromJSONString(jsonString: ff!)

        
        let array = jpwp["product"] as! Array<[String:AnyObject]>;
        self.array = array;

        for i in 0..<6
        {
            let dic = array[i];

            let image = UIButton();
            let pic = dic["pic"] as! String
            let coinB = dic["coinpic"] as! String
            image.setBackgroundImage(UIImage(named: pic), for: .normal);
            let row =  Int(i) / maxColos;
            let col = Int(i) % maxColos;
            let x = buttonStartX + col * (xmari + W);
            let y = buttonStartY + row * (ymari + H);
            image.frame = CGRect.init(x: x, y: y, width: W, height: H);
            image.addTarget(self, action: #selector(quedingClick(_:)), for: .touchUpInside);
            self.view.addSubview(image);
        }
        
    }
  
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary();
    }


    @IBAction func dismissclick(_ sender: Any) {
        dismiss(animated: false);
    }
    @objc @IBAction func quedingClick(_ sender: UIButton)
    {
        
    }
}
