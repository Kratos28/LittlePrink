//
//  EditProfileTableVC-Delegate.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import Foundation
import PhotosUI
import ActionSheetPicker_3_0
import DateToolsSwift
extension EditProfileTableVC
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let cell = tableView.cellForRow(at: indexPath);
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
            
        case 2:
            let acp =    ActionSheetStringPicker(title: "", rows: ["男","女"], initialSelection: gender ? 0 : 1, doneBlock: { picker , index, val in
                self.gender = index == 0;
                
            }, cancel: { _ in }, origin: cell);
            acp?.show();
        case 3:
            var  selectedDate = Date().subtract(TimeChunk(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 20));
        
            if let birth = birth{
                selectedDate = birth;
            }
            
            
          
            
            let datePicker = ActionSheetDatePicker(title: nil, datePickerMode: .date, selectedDate: selectedDate, doneBlock: { _, date, _ in
                self.birth =  date as? Date
            }, cancel: { _ in
                
            }, origin: cell);
            datePicker?.minimumDate = Date().subtract(TimeChunk(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 40));
            datePicker?.maximumDate = Date();
            datePicker?.show();
        case 4:
            let vc = storyboard!.instantiateViewController(identifier: kIntroVCID) as IntroVC
            vc.intro = intro;
            vc.delegate = self;
            present(vc, animated: true);
            break;
            
        default:
            break;
        }
    }
}

extension EditProfileTableVC:IntrolVCDelegate
{
    func updateIntro(_ intro: String) {
        self.intro = intro;
    }
}
