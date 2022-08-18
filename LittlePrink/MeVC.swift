//
//  MeVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/8/19.
//

import UIKit

class MeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        } else {
            // Fallback on earlier versions
        };
    }
    

}
