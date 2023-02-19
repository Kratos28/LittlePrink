//
//  commentSectionFooterView.swift
//  LittlePink
//
//  Created by Kratos on 2023/2/19.
//

import UIKit

class commentSectionFooterView: UITableViewHeaderFooterView {

    
     override init(reuseIdentifier:String?) {
        super.init(reuseIdentifier: reuseIdentifier);
         tintColor = .systemBackground;
         let separeLineView = UIView(frame: CGRect(x: 62, y: 0, width: screenRect.width - 62, height: 1));
         separeLineView.backgroundColor = .quaternaryLabel;
         addSubview(separeLineView);
    }
    
    required init(coder:NSCoder) {
        fatalError("");
    }
    
}
