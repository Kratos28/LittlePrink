//
//  CommentSectionFooterView.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/2/3.
//

import UIKit

class CommentSectionFooterView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier);
        tintColor = .systemBackground;
        let separator = UIView(frame: CGRectMake(62, 0, screenRect.width, 1));
        separator.backgroundColor = .quaternaryLabel;
        addSubview(separator);
    }

    required init?(coder: NSCoder) {
        fatalError();
    }
}
