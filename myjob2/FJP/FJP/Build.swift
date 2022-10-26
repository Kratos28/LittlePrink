//
//  Build.swift
//  FJP
//
//  Created by Kratos on 2022/10/21.
//

import UIKit
import CoreData
let jinbiupdate = "jinbiupdate";
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let persistentContainer = appDelegate.persistentContainer
let context = persistentContainer.viewContext
let backgroundContext = persistentContainer.newBackgroundContext()

@discardableResult func setupSign() ->[Sign]
{
    let s0 = Sign(context: context);
    s0.mingzi = "";
    s0.bgImageView = "6签到_框";
    s0.issign = false;
    s0.unSelectedBgimaView  = "";
    appDelegate.saveContext();
    
    let s1 = Sign(context: context);
    s1.mingzi = "";
    s1.bgImageView = "6签到_框拷贝";
    s1.issign = false;
    s1.unSelectedBgimaView  = "";
    appDelegate.saveContext();
    
    
    let s2 = Sign(context: context);
    s2.mingzi = "";
    s2.bgImageView = "6签到_框拷贝2";
    s2.issign = false;
    s2.unSelectedBgimaView  = "";
    appDelegate.saveContext();
    
    
    let s3 = Sign(context: context);
    s3.mingzi = "";
    s3.bgImageView = "6签到_框拷贝3";
    s3.issign = false;
    s3.unSelectedBgimaView  = "";
    appDelegate.saveContext();
    
    
    let s4 = Sign(context: context);
    s4.mingzi = "";
    s4.bgImageView = "6签到_框拷贝3(1)";
    s4.issign = false;
    s4.unSelectedBgimaView  = "";
    appDelegate.saveContext();
    
    
    let s5 = Sign(context: context);
    s5.mingzi = "";
    s5.bgImageView = "6签到_框拷贝3(2)";
    s5.issign = false;
    s5.unSelectedBgimaView  = "";
    appDelegate.saveContext();
    
//    let s6 = Sign(context: context);
//    s6.mingzi = "";
//    s6.bgImageView = "6签到_框拷贝4";
//    s6.issign = false;
//    s6.unSelectedBgimaView  = "";
//    appDelegate.saveContext();
    
    return getEntityName(entityName: "Sign", type: Sign.self);
}

func delete()
{
    let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: "P");
    let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar);
     do {
         try context.execute(DelAllReqVar)
     }
     catch {
         
     }
    
    

    
    
    
    let ReqVar2 = NSFetchRequest<NSFetchRequestResult>(entityName: "ZR");
    let DelAllReqVar2 = NSBatchDeleteRequest(fetchRequest: ReqVar2);
     do {
         try context.execute(DelAllReqVar2)
     }
     catch {
     }
    
//
    let ReqVar3 = NSFetchRequest<NSFetchRequestResult>(entityName: "Sign");
    let DelAllReqVar3 = NSBatchDeleteRequest(fetchRequest: ReqVar3);
     do {
         try context.execute(DelAllReqVar3)
     }
     catch {
     }
////
    let ReqVar4 = NSFetchRequest<NSFetchRequestResult>(entityName: "ZB");
    let DelAllReqVar4 = NSBatchDeleteRequest(fetchRequest: ReqVar4);
     do {
         try context.execute(DelAllReqVar4)
     }
     catch {
     }
//
//
//    let ReqVar5 = NSFetchRequest<NSFetchRequestResult>(entityName: "Zr");
//    let DelAllReqVar5 = NSBatchDeleteRequest(fetchRequest: ReqVar5);
//     do {
//         try context.execute(DelAllReqVar5)
//     }
//     catch {
//     }
//
//
//    let ReqVary6 = NSFetchRequest<NSFetchRequestResult>(entityName: "BossZr");
//    let DelAllReqVar6 = NSBatchDeleteRequest(fetchRequest: ReqVary6);
//     do {
//         try context.execute(DelAllReqVar6)
//     }
//     catch {
//     }
    
}


@discardableResult func setupZB()->[ZB]
{
    let z0 = ZB(context:context);
    z0.bgImageView = "7角色_选框 拷贝 3";
    z0.mingzi = "";
    z0.unbgImageView = "";
    z0.xuanzhong = false;
    z0.jiaoSe_XiangqingbgimageView = "7角色_弹窗_图标";
    z0.huoqu =  false;
    appDelegate.saveContext();
    return getEntityName(entityName: "ZB", type: ZB.self);

}



@discardableResult  func setupData() ->[P]
{
    delete();
    
    let p0 = P(context:context);
    p0.coin = 0;
    p0.zuanshi = 0;
    p0.headViewImage = "";
    p0.mingzi = "";
    p0.renwuImanname = "3主界面_b0";
    appDelegate.saveContext();
    
    
    
    let p1 = P(context:context);
    p1.coin = 0;
    p1.zuanshi = 0;
    p1.headViewImage = "";
    p1.mingzi = "";
    p1.renwuImanname = "3主界面_b1";
    appDelegate.saveContext();

    
    
    let p2 = P(context:context);
    p2.coin = 0;
    p2.zuanshi = 0;
    p2.headViewImage = "";
    p2.mingzi = "";
    p2.renwuImanname = "3主界面_b2";
    appDelegate.saveContext();
    
    setupSign();
    setupZB();
    return getEntityName(entityName: "P", type: P.self);
}
func getPlayData() ->P?
{
    let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName:"P");
    fetchRequest.predicate = NSPredicate(format: "select = %d", true);
    var fetchedResults: Array<P> = Array<P>()
      if let    fetchedResults1 =  try? context.fetch(fetchRequest) as? [P]
        {
          fetchedResults = fetchedResults1;
          if  fetchedResults.count > 0
          {
              return fetchedResults[0];
          }
          return nil;
        }
    return nil;
}


@discardableResult  func getZB() ->[ZB]{
    
    return getEntityName(entityName: "ZB", type: ZB.self);

}


@discardableResult  func getSign() ->[Sign]{
    
    
    return getEntityName(entityName: "Sign", type: Sign.self);

}


@discardableResult func getEntityName<T>(entityName:String,type:T.Type) -> [T]
 {
     let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:entityName);
     var fetchedResults: Array<T> = Array<T>()
     do{
         fetchedResults =  try context.fetch(fetchRequest) as! [T];
     }catch
     {
         fetchedResults = Array<T>()
     }
     return fetchedResults;
 }



