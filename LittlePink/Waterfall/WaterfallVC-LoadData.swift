//
//  WaterfallVC-LoadData.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/3.
//

import CoreData
import LeanCloud

extension WaterfallVC{
    func getDraftNotes(){

        let request = DraftNote.fetchRequest() as NSFetchRequest<DraftNote>
        //分页(上拉加载)
        //request.fetchOffset = 0
        //request.fetchLimit = 20
        
        //筛选
        //request.predicate = NSPredicate(format: "title = %@", "iOS")
        
        //排序
        let sortDescriptor1 = NSSortDescriptor(key: "updatedAt", ascending: false)
        //let sortDescriptor2 = NSSortDescriptor(key: "title", ascending: true) //文本的话按汉字的UNICODE编码或英文字母
        request.sortDescriptors = [sortDescriptor1] //数组中谁在前谁优先
        
        //Fault--只在需要时加载数据(类似懒加载)--提高性能
        //request.returnsObjectsAsFaults = true //默认true,无需设置
        //一开始只加载draftNotes的metadata(放入内存)
        //等实际访问到某个draftNote下面的某个属性的时候才加载此draftNote所有属性到内存--触发Fault
        
        //指定字段--提高性能
        //访问的某个draftNote下面的属性若已在propertiesToFetch中指定,则访问此属性不会触发Fault,访问其他属性会触发Fault
        request.propertiesToFetch = ["coverPhoto", "title", "updatedAt", "isVideo"]
        
        showLoadHUD()
        backgroundContext.perform {
            if let draftNotes = try? backgroundContext.fetch(request){
                self.draftNotes = draftNotes
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            self.hideLoadHUD()
        }
        
        
        
    }
    
    func getNotes(){
        let query = LCQuery(className: kNoteTable)
        query.whereKey(kChannelCol, .equalTo(channel))//条件查询
        query.whereKey(kAuthorCol, .included)//同时查询出作者对象
        query.whereKey(kUpdatedAtCol, .descending)//排序
        query.limit = kNotesOffset//上拉加载的分页
        
        query.find { result in
            if case let .success(objects: notes) = result{
                self.notes = notes;
                self.collectionView.reloadData();
            
            }
            
        }
    }
    func getMyNotes(_ user :LCUser){
        let query = LCQuery(className: kNoteTable)
        query.whereKey(kAuthorCol, .equalTo(user))//条件查询
        query.whereKey(kAuthorCol, .included)//同时查询出作者对象
        query.whereKey(kUpdatedAtCol, .descending)//排序
        query.limit = kNotesOffset//上拉加载的分页
        
        query.find { result in
            if case let .success(objects: notes) = result{
                self.notes = notes;
                self.collectionView.reloadData();
            
            }
            
        }
    }
}
