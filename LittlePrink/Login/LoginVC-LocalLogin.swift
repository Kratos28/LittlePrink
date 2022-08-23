//
//  LoginVC-LocalLogin.swift
//  LittlePrink
//
//  Created by Kratos on 2022/8/23.
//

import Foundation
import AdSupport
import simd
extension LoginVC
{
    @objc func localLogin(){
        let adString = ASIdentifierManager.shared().advertisingIdentifier.uuidString;
        let config = JVAuthConfig();
        config.appKey = kJAppKey;
        config.advertisingId = adString;
        config.authBlock = { _  in
            if JVERIFICATIONService.isSetupClient()
            {
                
            }
        };
        JVERIFICATIONService.setup(with: config);
    }
}
