//
//  LC-Extensions.swift
//  LittlePrink
//
//  Created by Kratos on 2022/9/17.
//

import Foundation
import LeanCloud
extension LCFile
{
    func save( to table:LCObject,as record:String)
    {
        self.save { result in
           switch result {
               case .success:
               
               if let value = self.objectId?.value
               {
                   print("文件保存完成");
                   do {
                       try table.set(record, value:self);
                       table.save { result in
                           switch result {
                           case .success:
                               break;
                           case .failure(error: let error ):
                               break;
                           }
                       }
                   } catch{
                       print("给User字段赋值失败");
                   }
               }
           case .failure(let error):
               print("保存文件失败");
           }
       }

    }
}
