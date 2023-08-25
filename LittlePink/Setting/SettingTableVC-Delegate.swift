//
//  SettingTableVC-Delegate.swift
//  LittlePink
//
//  Created by k on 2023/8/25.
//

import Kingfisher
extension SettingTableVC
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let section = indexPath.section;
        let row = indexPath.row;
        if section == 1, row == 1{
            ImageCache.default.clearCache{
                self.showTextHUD("清楚缓存成功");
                self.cacheSizeLabel.text = kNoCachePH;
            }
        }
    }
}
