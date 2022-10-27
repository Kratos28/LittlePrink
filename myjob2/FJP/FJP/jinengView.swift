//
//  jinengView.swift
//  FJP
//
//  Created by K on 2022/10/27.
//

import UIKit

class jinengView: UIButton {
    var shifoudiren : Bool  = false;
    var jineng :Kaipai?
    convenience init(frame: CGRect,kai:Kaipai,shifoudiren:Bool)
    {
        self.init(frame: frame);
        self.shifoudiren = shifoudiren;
        self.jineng = kai;
        
        
        self.setBackgroundImage(UIImage(named: kai.bgImageview!), for: .normal);

    }
    
}
