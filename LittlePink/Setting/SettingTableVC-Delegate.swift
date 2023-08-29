//
//  SettingTableVC-Delegate.swift
//  LittlePink
//
//  Created by k on 2023/8/25.
//

import Kingfisher
import LeanCloud
extension SettingTableVC
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let section = indexPath.section;
        let row = indexPath.row;
        
        
        if section == 0,row == 0{
            
        }else if section == 1, row == 1{
            ImageCache.default.clearCache{
                self.showTextHUD("清楚缓存成功");
                self.cacheSizeLabel.text = kNoCachePH;
            }
        }else if section == 3{
            let appID = "";
//            let path = "https://itunes.apple.com/app/id\(appID)" //跳转到appStore
            let path = "https://itunes.apple.com/app/id\(appID)?action=write-review";//跳转到appStore 评论
            guard let url = URL(string: path),UIApplication.shared.canOpenURL(url)else {return};
            UIApplication.shared.open(url);
        }else if section == 4
        {
            dismiss(animated: true);
            LCUser.logOut();
            let loginVC = storyboard!.instantiateViewController(withIdentifier: kLoginVCID);
            loginAndMeParentVC.removeChildren();
            loginAndMeParentVC.addChild(loginVC);
        }
    }
}
