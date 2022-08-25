//
//  LoginVC-LocalLogin.swift
//  LittlePrink
//
//  Created by Kratos on 2022/8/23.
//

import Foundation
import AdSupport
extension LoginVC
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
                        self.presentLocalLoginVC();
                    }
                }
            }else
            {
                self.hideLoadHUD();
                self.presentLocalLoginVC();
            }
        };
        JVERIFICATIONService.setup(with: config);
    }
    
    
    private func setLocalLoginUI()
    {
        let config = JVUIConfig();
        config.prefersStatusBarHidden = true;
        config.navTransparent = true;
        config.navText = NSAttributedString(string: "");
        
//        let logoConstrainX = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.super, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0);
        
        let logoConstrainY = JVLayoutConstraint(attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, to: JVLayoutItem.super, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1/7, constant: 0);
        config.logoConstraints = [logoConstrainY!];
        JVERIFICATIONService.customUI(with: config);
    }
    
    
    private func presentLocalLoginVC()
    {
        
        JVERIFICATIONService.getAuthorizationWith(self, hide: true, animated: true, timeout: 5*1000) { (result) in
            JVERIFICATIONService.clearPreLoginCache();
            
                if let  result = result ,let token = result["loginToken"] {
                    
                }
            
            
        } actionBlock: { type, content in
            if let content = content{
                print("一键登录,\(type),content=\(content)");
            }
        }
    }
}

