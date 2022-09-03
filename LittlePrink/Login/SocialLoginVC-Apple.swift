//
//  SocialLoginVC-Apple.swift
//  LittlePrink
//
//  Created by Kratos on 2022/9/3.
//

import Foundation
import AuthenticationServices
extension SocialLoginVC : ASAuthorizationControllerDelegate
{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userID = appleIDCredential.user;
            let  status = appleIDCredential.realUserStatus;
            let familyName = appleIDCredential.fullName?.familyName
           let givenName =  appleIDCredential.fullName?.givenName;
            let email = appleIDCredential.email;
            
            
        case let appleIDCredential as  ASPasswordCredential:
            print("");
        default:
            break;
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("");
    }
}


extension SocialLoginVC: ASAuthorizationControllerPresentationContextProviding
{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        view.window!;
    }
  
}
