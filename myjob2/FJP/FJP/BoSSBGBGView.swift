//
//  BoSSBGBGView.swift
//  FJP
//
//  Created by K on 2022/10/27.
//

import UIKit

class BoSSBGBGView: UIView {

    var siwang:UIView?
    
    override init(frame: CGRect) {
        super .init(frame: frame);
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        
    }
    override func layoutSubviews() {
        if self.siwang != nil
        {
            NotificationCenter.default.post(name: NSNotification.Name("siwang"), object: nil);
        }
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        self.siwang = subview;
    }
}
