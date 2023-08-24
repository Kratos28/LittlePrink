//
//  EditProfileTableVC-Delegate.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import Foundation
import PhotosUI
extension EditProfileTableVC
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        switch indexPath.row {
        case 0:
            var config =  PHPickerConfiguration();
            config.filter = .images;
            config.selectionLimit = 1;
            let vc = PHPickerViewController(configuration: config);
            vc.delegate = self;
            present(vc, animated: true, completion: nil);
        case 1:
            showTextHUD("修改昵称和修改简介一样");
        default:
            break;
        }
    }
}
