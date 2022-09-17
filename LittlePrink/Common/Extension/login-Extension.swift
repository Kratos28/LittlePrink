//
//  login-Extension.swift
//  LittlePrink
//
//  Created by Kratos on 2022/9/18.
//

import Foundation
import LeanCloud

extension UIViewController
{
    func configAfterLogin(_ user :LCUser, _ nickname : String,_ email:String = "") {
        
        
        if let _ = user.get(kNickName)
        {
            
        }else
        {
            let randomAvatar = UIImage(named:"avatarPH\(Int.random(in: 1...4))")!;
            if let avatarData = randomAvatar.pngData(){
                let avatarFile =  LCFile(payload: .data(data: avatarData));
                avatarFile.mimeType = "image/jpeg";
                avatarFile.save(to: user, as: kAvatarCol);
            }
            
            do {
                if email != "" {
                    user.email = LCString(email);
                }
                try  user.set(kNickName, value: nickname);
                
                
            } catch {
                print("给User字段赋值失败");
                return;
            }
            
            user.save { result in
                if case . success = result {
                    
                }
            }
        }
    
    }
}
