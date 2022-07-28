//
//  POIVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/20.
//

import UIKit
import CoreLocation

class POIVC: UIViewController {

    lazy var locationManager = AMapLocationManager()
     var pois = [["不显示位置",""]];
    lazy var mapSearch = AMapSearchAPI();
    lazy private var aroundSearchRequest : AMapPOIAroundSearchRequest = {
        let reqeust = AMapPOIAroundSearchRequest();
        reqeust.location = AMapGeoPoint.location(withLatitude: CGFloat(39.990459), longitude: CGFloat(116.481476));
        return reqeust;
    }();
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config();
        requestLoaction();
        
        mapSearch?.delegate = self;
        
    }
    
    
    
    
    
    

}

extension POIVC:AMapSearchDelegate
{
    
}
extension POIVC:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kPOICellID,for: indexPath) as! POICell;
        let poi = pois[indexPath.row];
        cell.poi = poi;
        return cell;
    }
    
    
}


extension POIVC:UITableViewDelegate
{
    
}
