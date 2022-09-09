//
//  PasswordLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/9/9.
//

import UIKit

class PasswordLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: false);
    }
    
    @IBAction func backtoCodeLoginVC(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: false);
    }

}
