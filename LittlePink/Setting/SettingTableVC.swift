//
//  SettingTableVCTableViewController.swift
//  LittlePink
//
//  Created by k on 2023/8/25.
//

import UIKit
import Kingfisher

class SettingTableVC: UITableViewController {

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
