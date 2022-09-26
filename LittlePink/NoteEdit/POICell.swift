//
//  POICell.swift
//  LittlePink
//
//  Created by 刘军 on 2020/12/19.
//

import UIKit

class POICell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var poi = ["", ""]{
        didSet{
            nameLabel.text = poi[0]
            addressLabel.text = poi[1]
        }
    }

}
