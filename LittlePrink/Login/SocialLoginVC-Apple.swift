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
            
            
            
            
        case let passwordCredential as  ASPasswordCredential:
            let _ = passwordCredential.user;
            let _ = passwordCredential.password;
            
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


extension SocialLoginVC{
    func checkSignInWithAppleState(with userID:String){
        let appleIDProvider = ASAuthorizationAppleIDProvider();
        appleIDProvider.getCredentialState(forUserID: userID) { credentialState, error in
            switch credentialState{
                
            case .authorized:
                print("用户已经登录，展示登录后的UI页面");
            case .revoked:
                print("用户已从设置里面退出登录或用其他的AppleID进行登录了");
            case .authorized:
                print("用户已登录");
            case .notFound:
                print("无此用户");
             default:
                break;
                
            }
            
            
        }
    }
}
