//
//  Build.swift
//  FJP
//
//  Created by Kratos on 2022/10/21.
//

import Foundation
import UIKit
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let persistentContainer = appDelegate.persistentContainer
let context = persistentContainer.viewContext
let backgroundContext = persistentContainer.newBackgroundContext()

func setupData()
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
    
}
