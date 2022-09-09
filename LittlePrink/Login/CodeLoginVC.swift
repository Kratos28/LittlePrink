//
//  CodeLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/9/9.
//

import UIKit

class CodeLoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var getAuthCodeBtn: UIButton!
    @IBOutlet weak var authCodeTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        hideKeyBoardWhenTappedAround();
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true);
    }
    

    @IBAction func getAuthCode(_ sender: Any) {
    }
    
    @IBAction func login(_ sender: Any) {
    }
}
