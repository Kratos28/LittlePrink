//
//  AccountTableVC-Delegate.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/30.
//

import Foundation

extension AccountTableVC{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let section = indexPath.section;
        let row = indexPath.row;
        if section == 0{
            if row == 0
            {
                showTextHUD("绑定,解绑,换绑手机号");
            }else if row == 1{
                if let _ = phoneNumStr{
                    performSegue(withIdentifier: "showPasswordTableVC", sender: nil);
                }else{
                    showTextHUD("绑定手机")
                }
            }
        }
    }
}
