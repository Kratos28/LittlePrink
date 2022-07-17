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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ChannelVC = parent as! ChannelVC
        ChannelVC.PVdelegate?.updateChannel(channel: channel, subChannel: subChannels[indexPath.row]);
        dismiss(animated: false);
    }
    

    
}
extension ChannelTableVC :IndicatorInfoProvider
{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: channel);
    }
}
