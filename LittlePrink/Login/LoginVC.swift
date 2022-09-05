//
//  LoginVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/8/23.
//

import UIKit

class LoginVC: UIViewController {

    
    lazy var loginBtn :UIButton = {
        let button = UIButton();
        button.setTitle("登录", for: .normal);
        button.setTitleColor(UIColor.white, for: .normal);
        button.backgroundColor = mainColor;
        button.layer.cornerRadius = 22;
        button.addTarget(self, action: #selector(localLogin), for: .touchUpInside);
        button.translatesAutoresizingMaskIntoConstraints = false;
        return button;
        
    }();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.addSubview(loginBtn);
        
        setUI();
    }
    func setUI()
    {
        loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive =  true;
        loginBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        loginBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true;
        loginBtn.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.8).isActive  = true;
    }

  

}
