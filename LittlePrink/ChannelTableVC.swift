//
//  ChannelTableViewVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/16.
//

import UIKit
import XLPagerTabStrip

class ChannelTableVC: UITableViewController {
    var channel = "";
    var subChannels : [String] = [];
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return subChannels.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ksubChannelCellID, for: indexPath)
        
        cell.textLabel?.text = "# \(subChannels[indexPath.row])";
        cell.textLabel?.font = .systemFont(ofSize: 15);
        return cell
    }
    

    
}
extension ChannelTableVC :IndicatorInfoProvider
{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: channel);
    }
}
