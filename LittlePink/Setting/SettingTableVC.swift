//
//  SettingTableVCTableViewController.swift
//  LittlePink
//
//  Created by k on 2023/8/25.
//

import UIKit
import Kingfisher
import LeanCloud
class SettingTableVC: UITableViewController {
    var user:LCUser!
    var cacheSizeStr =  kNoCachePH {
        didSet{
            DispatchQueue.main.async {
                self.cacheSizeLabel.text = self.cacheSizeStr;
            }
        }
    }
    
    
    
    @IBOutlet weak var cacheSizeLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageCache.default.calculateDiskStorageSize { res in
            if case let .success(size)  = res{
                var cacheSize = "";

                
                
                var cacheSizeStr : String{
                    guard size > 0 else {return kNoCachePH}
                    guard size >= 1024 else {return "\(size) B"}
                    guard size >= 1048576 else{ return"\(size / 1024) KB"}
                    guard size >= 1073741824 else{return"\(size / 1048576) MB"}
                   return "\(size / 1073741824) GB"
                }
                self.cacheSizeStr = cacheSizeStr;
            }
        }

    }

    // MARK: - Table view data source

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let accountTableVC  = segue.destination as? AccountTableVC
        {
            accountTableVC.user = user;
        }
    }
   
    
}
