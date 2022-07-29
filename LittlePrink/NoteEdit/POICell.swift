//
//  POICell.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/26.
//

import UIKit

class POICell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var poi = ["",""]{
        didSet
        {
            nameLabel.text = poi[0]
            addressLabel.text = poi[1]
        }
    }


}
