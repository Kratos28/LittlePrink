//
//  SocialLoginVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/22.
//

import UIKit
import AuthenticationServices

class SocialLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func signInWithAlipay(_ sender: Any) {
        signInWithAlipay()
    }
    
    @IBAction func signInWithApple(_ sender: Any) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.email, .fullName]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
}
