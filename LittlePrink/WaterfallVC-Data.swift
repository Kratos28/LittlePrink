//
//  WaterfallVC-Data.swift
//  LittlePrink
//
//  Created by K on 2022/8/15.
//

import Foundation
import CoreData


extension WaterfallVC
{
    func getDraftNotes()
    {
        
        
        let request = DraftNote.fetchRequest() as NSFetchRequest<DraftNote>;
//        request.fetchLimit =  20;
//        request.fetchOffset = 0;
        request.predicate = NSPredicate(format: "title = %@", "iOS");
        let sortDescriptors = NSSortDescriptor(key: "updateAt", ascending: true);
        let sortDescriptors2 = NSSortDescriptor(key: "title", ascending: true);
        request.sortDescriptors = [sortDescriptors,sortDescriptors2];
        let draftNote =  try! context.fetch(request);
        self.draftNotes = draftNote;
        
    }
}
