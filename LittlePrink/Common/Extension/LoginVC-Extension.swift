//
//  LoginVC-LocalLogin.swift
//  LittlePrink
//
//  Created by Kratos on 2022/8/23.
//

import Foundation
import AdSupport
import UIKit
import Alamofire
extension UIViewController
{
    @objc func localLogin(){
        let adString = ASIdentifierManager.shared().advertisingIdentifier.uuidString;
        showLoadHUd();
        let config = JVAuthConfig();
        config.appKey = kJAppKey;
        config.advertisingId = adString;
        config.authBlock = { _  in
            if JVERIFICATIONService.isSetupClient(){
                JVERIFICATIONService.preLogin(5000) { (result) in
                    self.hideLoadHUD();
                    if let result = result, let code = result["code"]as? Int,code == 7000{
                        //预取号成功
                        self.setLocalLoginUI();
                        self.presentLocalLoginVC();
                    }else
                    {
                        self.presentCodeLoginVC();
                    }
                }
            }else
            {
                
                self.hideLoadHUD();
                self.presentCodeLoginVC();
            }
        };
        JVERIFICATIONService.setup(with: config);
    }
    


    

    
    private func presentLocalLoginVC()
    {
        
        JVERIFICATIONService.getAuthorizationWith(self, hide: true, animated: true, timeout: 5*1000) { (result) in
            
                if let  result = result ,let token = result["loginToken"] as? String {
                    JVERIFICATIONService.clearPreLoginCache();
//                    self.getEncryptedPhoneNum(token);
                    print(token);
                }else
                {
                    self.otherLogin();
                }
            
        } actionBlock: { type, content in
            if let content = content{
                print("一键登录,\(type),content=\(content)");
            }
        }
    }
    
}

extension UIViewController
{
    
    func presentCodeLoginVC()
    {
        let mainSB =  UIStoryboard(name: "Main", bundle: nil);
        let LoginNaviC = mainSB.instantiateViewController(identifier: kloginNavID);
        LoginNaviC.modalPresentationStyle = .fullScreen;
        self.present(LoginNaviC, animated: true);
    }
}

extension UIViewController
{
    @objc private func otherLogin()
    {
        JVERIFICATIONService.dismissLoginController(animated: true, completion: {
            self.presentCodeLoginVC();
        });
    }
    
    
    
    
    @objc private func dismiisLocalVC()
    {
        JVERIFICATIONService.dismissLoginController(animated: true, completion: nil);
    }
}


extension UIViewController
{
    
    private func setLocalLoginUI()
    {
        let config = JVUIConfig();
        config.prefersStatusBarHidden = true;
        config.navTransparent = true;
        config.navText = NSAttributedString(string: " ");
        config.navReturnHidden = true;
        config.navControl = UIBarButtonItem(title: "关闭", style:.plain , target: self, action: #selector(dismiisLocalVC))
        
        let constrainX = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.super, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1/7, constant: 0)!;
        
        
        let logoConstrainY = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.super, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1/7, constant: 0)!;
        
        
        
        
        
        config.logoConstraints = [constrainX,logoConstrainY];
        let numberConstrainY  = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.super, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 35)!;
        config.numberConstraints = [numberConstrainY];
        let sloganConstrainY =   JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.number, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 35)!;
        config.sloganConstraints = [constrainX,sloganConstrainY];
        config.logBtnText = "同一协议并一键登录";
        config.logBtnImgs =
        [
            UIImage(named: "localLoginBtn-nor")!,
            UIImage(named: "localLoginBtn-nor")!,
            UIImage(named: "localLoginBtn-hig")!
        ];
        
        
        let logBtnConstrainY = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.slogan, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 50)!
        config.logBtnConstraints = [constrainX,logBtnConstrainY];
        config.privacyState = true;
        config.checkViewHidden = true;
        
        
        config.appPrivacyOne = ["用户协议","www.baidu.com"];
        config.privacyTextAlignment = .center;
        config.appPrivacyTwo = ["隐私政策","https://www.baicu.com"];
        config.privacyComponents = ["登录注册代表你已同意","以及"," "," "];
        config.appPrivacyColor = [UIColor.secondaryLabel,blueColor];
        
        let privacyConstrainY = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.super, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -70)!;
        
        
        
        let privacyConstrainW = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.none, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 260)!;
        
     
         
        
        config.privacyConstraints = [constrainX,privacyConstrainY,privacyConstrainW];
        config.agreementNavBackgroundColor = mainColor;
        config.agreementNavReturnImage = UIImage(systemName: "chevron.left")
        
        
        
        
        JVERIFICATIONService.customUI(with: config) { customView in
            guard let custtomView = customView else{return};
            let otherloginBtn  = UIButton();
            otherloginBtn.titleLabel?.font = .systemFont(ofSize: 15);
            otherloginBtn.setTitle("其他方式登录", for: .normal);
            otherloginBtn.setTitleColor(.secondaryLabel, for: .normal);
            otherloginBtn.translatesAutoresizingMaskIntoConstraints  = false;
            otherloginBtn.addTarget(self, action: #selector(self.otherLogin), for: .touchUpInside);
            customView?.addSubview(otherloginBtn);
            NSLayoutConstraint.activate([
                otherloginBtn.centerXAnchor.constraint(equalTo: custtomView.centerXAnchor),
                otherloginBtn.centerYAnchor.constraint(equalTo: custtomView.centerYAnchor,constant: 170),
                otherloginBtn.widthAnchor.constraint(equalToConstant: 279)
            ]);
        }
    }
}

extension UIViewController
{
    struct LocalLoginRes :Decodable {
        let phone : String
    }
    
    func getEncryptedPhoneNum(_ loginToken:String)
    {
        let header: HTTPHeaders = [
            .authorization(username: kJAppKey, password: ""),
            
        ]
        let parameters = ["loginToken":loginToken]
        AF.request("https://api.verification.jpush.cn/v1/web/loginTokenVerify", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: header).responseDecodable(of:LocalLoginRes.self) { response in
            if let localLoginRes = response.value {
                print(localLoginRes.phone);
            }
            
        }
    }
}
