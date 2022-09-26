//
//  EditProfileTableVC-Delegate.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/11.
//

import PhotosUI
import ActionSheetPicker_3_0
import DateToolsSwift

extension EditProfileTableVC{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        switch indexPath.row {
        
        case 0:
            //即将全面替代UIImagePickerController的照片视频选择器
            var config = PHPickerConfiguration()
            config.filter = .images
            config.selectionLimit = 1
            let vc = PHPickerViewController(configuration: config)
            vc.delegate = self
            present(vc, animated: true)
            
        case 1:
            showTextHUD("修改昵称,和修改简介一样.这里需做一些限制")
            
        case 2:
            //单项选择器
            let acp = ActionSheetStringPicker(
                title: nil,
                rows: ["男","女"],
                initialSelection: gender ? 0 : 1, //初始选项
                doneBlock: { (_, index, _) in self.gender = index == 0 },
                cancel: { _ in },
                origin: cell)
            acp?.show()
            
        case 3:
            //日期选择器
            var selectedDate = Date().subtract(TimeChunk(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 20))
            
            if let birth = birth{ selectedDate = birth }
            
            let datePicker = ActionSheetDatePicker(
                title: nil,
                datePickerMode: .date, //显示日期,UIDatePcker里的属性
                selectedDate: selectedDate, //初始日期
                doneBlock: { (_, date, _) in self.birth = date as? Date },
                cancel: { _ in },
                origin: cell)
            
            //最早和最晚日期
            datePicker?.minimumDate = Date().subtract(TimeChunk(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 40))
            datePicker?.maximumDate = Date()
            
            datePicker?.show()
            
        case 4:
            //和个人页编辑简介差不多,此处正向传值需传全局变量intro
            let vc = storyboard!.instantiateViewController(identifier: kIntroVCID) as! IntroVC
            vc.intro = intro
            vc.delegate = self
            present(vc, animated: true)
            
        default:
            break
        }
    }
}

extension EditProfileTableVC: IntroVCDelegate{
    func updateIntro(_ intro: String) { self.intro = intro }
}
