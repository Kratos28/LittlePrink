//
//  Build.swift
//  FJP
//
//  Created by Kratos on 2022/10/21.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let persistentContainer = appDelegate.persistentContainer
let context = persistentContainer.viewContext
let backgroundContext = persistentContainer.newBackgroundContext()

func setupData() ->[P]
{
    let p0 = P(context:context);
    p0.coin = 0;
    p0.headViewImage = "";
    p0.mingzi = "";
    appDelegate.saveContext();
    
    
    
    let p1 = P(context:context);
    p1.coin = 0;
    p1.headViewImage = "";
    p1.mingzi = "";
    appDelegate.saveContext();

    
    
    let p2 = P(context:context);
    p2.coin = 0;
    p2.headViewImage = "";
    p2.mingzi = "";
    appDelegate.saveContext();
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
