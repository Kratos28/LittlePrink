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
            print(String(decoding:appleIDCredential.identityToken!, as: UTF8.self));
            var name = "";
            
            if appleIDCredential.fullName?.familyName != nil || appleIDCredential.fullName?.givenName != nil
            {
                let familyName =  appleIDCredential.fullName!.familyName;
                let givenName = appleIDCredential.fullName!.givenName;
                 name = "\(familyName)\(givenName)";
                UserDefaults.standard.setValue(name, forKey: kNameFromAppleID);
            }else
            {
                name = UserDefaults.standard.string(forKey: kNameFromAppleID) ?? "";
            }
            
            
            var email = "";
            if let unwrappedEmail = appleIDCredential.email
            {
                email = unwrappedEmail;
                UserDefaults.standard.setValue(email, forKey: kEmailFromAppleID);
            }else
            {
                email =  UserDefaults.standard.string(forKey: kEmailFromAppleID) ?? "";
            }
            guard let identityToken = appleIDCredential.identityToken,
                  let  authorizationCode = appleIDCredential.authorizationCode else {return};
            
            
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
