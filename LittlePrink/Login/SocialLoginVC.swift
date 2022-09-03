//
//  SocialLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/8/30.
//

import UIKit
import Alamofire
import AuthenticationServices
class SocialLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInWithApple(_ sender: Any) {
        let provider =  ASAuthorizationAppleIDProvider();
        let request = provider.createRequest();
        request.requestedScopes = [.email,.fullName];
        
        let controller = ASAuthorizationController(authorizationRequests: [request]);
        controller.delegate  = self;
        controller.presentationContextProvider = self;
        controller.performRequests();
        
    }
    
}

