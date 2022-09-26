//
//  Login-Extensions.swift
//  LittlePink
//
//  Created by 刘军 on 2021/2/5.
//

import LeanCloud

extension UIViewController{
    func configAfterLogin(_ user: LCUser, _ nickName: String, _ email: String = ""){
        if let _ = user.get(kNickNameCol){
            dismissAndShowMeVC(user)
        }else{//首次登录(即注册)
            //enter和leave成对出现,全部配对成功后再执行notify中内容,整个过程不会阻塞主线程(同时拥有同步和异步的好处)
            let group = DispatchGroup()
            
            let randomAvatar = UIImage(named: "avatarPH\(Int.random(in: 1...4))")!
            if let avatarData = randomAvatar.pngData(){
                let avatarFile = LCFile(payload: .data(data: avatarData))
                avatarFile.mimeType = "image/jpeg"
                
                avatarFile.save(to: user, as: kAvatarCol, group: group)
            }
            
            do {
                if email != ""{
                    user.email = LCString(email)
                }
                try user.set(kNickNameCol, value: nickName)
            } catch {
                print("给User表的字段赋值失败: \(error)")
                return
            }
            
            group.enter()
            user.save { _ in group.leave() }
            
            //注册时同时给UserInfo表写入一行数据,方便之后取xxCount数据
            group.enter()
            let userInfo = LCObject(className: kUserInfoTable)
            try? userInfo.set(kUserObjectIdCol, value: user.objectId)
            userInfo.save{ _ in group.leave()}
            
            group.notify(queue: .main) {
                self.dismissAndShowMeVC(user)
            }
        }
    }
    
    func dismissAndShowMeVC(_ user: LCUser){
        hideLoadHUD()
        
        //把当前设备关联上当前登录的user,以便之后通过查询过滤Installation表给这个user的设备发送推送
        let installation = LCApplication.default.currentInstallation
        try? installation.set(kUserCol, value: user)
        installation.save{ _ in }//有存入失败的可能性,若那样则此用户再也没机会收到推送了,故在appdelegate中继续处理
        
        DispatchQueue.main.async {
            let mainSB = UIStoryboard(name: "Main", bundle: nil)
            let meVC = mainSB.instantiateViewController(identifier: kMeVCID) { coder in
                MeVC(coder: coder, user: user)
            }
            loginAndMeParentVC.removeChildren()
            loginAndMeParentVC.add(child: meVC)
            
            self.dismiss(animated: true)
        }
    }
}
