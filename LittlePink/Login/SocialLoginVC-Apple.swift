//
//  SocialLoginVC-Apple.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/26.
//
import AuthenticationServices
import LeanCloud

extension SocialLoginVC: ASAuthorizationControllerDelegate{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        //当判断结果是否为某个类型时，可用switch值绑定，也可用iflet或guard做
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            //print(appleIDCredential.realUserStatus) //用户状态--是否是真人，非100%保证
            
            //每个用户的userID在同一开发者账号(team)下的所有App都是一样的，可以用该唯一标识符与自己后台系统的账号体系绑定起来
            //通常和主键一起被存在后端数据库，用来区分用户
            let userID = appleIDCredential.user
            //print(userID)
            
            
            //身份信息(name,email)仅第一次登录时可获得，官方建议获得后立即保存在本地，也可防止因网络等而造成的数据丢失
            
            var name = ""
            if appleIDCredential.fullName?.familyName != nil || appleIDCredential.fullName?.givenName != nil{
                let familyName = appleIDCredential.fullName?.familyName ?? ""
                let givenName = appleIDCredential.fullName?.givenName ?? ""
                name = "\(familyName)\(givenName)"
                UserDefaults.standard.setValue(name, forKey: kNameFromAppleID)
            }else{
                name = UserDefaults.standard.string(forKey: kNameFromAppleID) ?? ""
            }
            //print(name)
            
            var email = ""
            //用户可隐藏真实邮箱,使用苹果提供的虚拟代理邮箱(固定后缀:privaterelay.appleid.com)
            //用户填写虚拟邮箱时,邮件将通过苹果中转服务发送,详见文档https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_js/communicating_using_the_private_email_relay_service
            if let unwrappedEmail = appleIDCredential.email{
                email = unwrappedEmail
                UserDefaults.standard.setValue(email, forKey: kEmailFromAppleID)
            }else{
                email = UserDefaults.standard.string(forKey: kEmailFromAppleID) ?? ""
            }
            //print(email)
            
            guard let identityToken = appleIDCredential.identityToken,
                  let authorizationCode = appleIDCredential.authorizationCode else { return }
            
            //print(String(decoding: identityToken, as: UTF8.self))
            //print(String(decoding: authorizationCode, as: UTF8.self))
            
            
            //传identityToken和authorizationCode去服务端,并在服务端做如下操作
            //1.用苹果提供的公钥对identityToken验签
            //2.用authorizationCode换取accessToken和refreshToken
            //3.若验签成功，可以根据userID(查询数据库)判断账号是否已存在，若存在，则返回自己账号系统的登录态，若不存在，则创建一个新的账号，并返回对应的登录状态给App
            
            //注:1和2我们只需传token和code,其余工作后端云服务已帮我们做好
            //注:验签目的；若直接发送用户信息去后台，中途可能被挟持并篡改，需验证信息来源(主要是userID)为此开发者传的（也即信息为苹果提供的）
            let appleData: [String: Any] = [
                "uid": userID,
                "identity_token": String(decoding: identityToken, as: UTF8.self),
                "code": String(decoding: authorizationCode, as: UTF8.self)
            ]
            let user = LCUser()
            user.logIn(authData: appleData, platform: .apple) { result in
                switch result {
                case .success:
                    //assert(user.objectId != nil)
                    self.configAfterLogin(user, name, email)
                case .failure(error: let error):
                    DispatchQueue.main.async {
                        self.showTextHUD("登录失败", in: self.parent!.view, error.reason)                        
                    }
                }
            }

        case let passwordCredential as ASPasswordCredential:
            let _ = passwordCredential.user
            let _ = passwordCredential.password
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("苹果认证服务登录失败: \(error)")
    }
    
}
//在当前页面present苹果登录页面
extension SocialLoginVC: ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor { view.window! }
}

extension SocialLoginVC{
    //根据userID检查登录状态--通常在每次启动App时执行
    func checkSignInWithAppleState(with userID: String){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userID) { (credentialState, error) in
            switch credentialState{
            case .authorized:
                print("用户已登录,展示登录后的UI页面")
            case .revoked:
                print("用户已从设置里面退出登录或用其他的AppleID进行登录了,展示应用的总登录页")
            case .notFound:
                print("无此用户,展示应用的总登录页")
            default:
                break
            }
        }
    }
}
