//
//  SettingTableVC-Delegate.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/15.
//

import Kingfisher
import LeanCloud

extension SettingTableVC{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 1, row == 1{//清除缓存
            //清除沙盒中Library/Caches中的文件(包含第三方包和自定义的缓存)
            //此处可加alert框,用户确认后可加progress条或小菊花等--省略
            ImageCache.default.clearCache {
                self.showTextHUD("清除缓存成功")
                self.cacheSizeLabel.text = kNoCachePH
            }
            
        }else if section == 3{//跳转至AppStore里的本App的的评价页面
            //待做
            let appID = "当前App的ID" //打包上传至开发者后台时可获得
            //let path = "https://www.google.com" //可跳转至普通网页
            //let path = "https://itunes.apple.com/app/id\(appID)" //跳转至AppStore里的本App的首页面
            let path = "https://itunes.apple.com/app/id\(appID)?action=write-review" //跳转至AppStore里的本App的的评价页面
            
            guard let url = URL(string: path), UIApplication.shared.canOpenURL(url) else { return }
            UIApplication.shared.open(url)
            
        }else if section == 4{//退出登录
            dismiss(animated: true)
            
            LCUser.logOut()
            let loginVC = storyboard!.instantiateViewController(identifier: kLoginVCID)
            loginAndMeParentVC.removeChildren()
            loginAndMeParentVC.add(child: loginVC)
        }
    }
}
