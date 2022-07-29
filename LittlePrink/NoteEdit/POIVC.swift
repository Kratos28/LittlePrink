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
    var latitude : CLLocationDegrees = 0.0;
    var longitude : CLLocationDegrees = 0.0;
    
    
    lazy var mapSearch = AMapSearchAPI();
    lazy  var aroundSearchRequest : AMapPOIAroundSearchRequest = {
        let reqeust = AMapPOIAroundSearchRequest();
        reqeust.location = AMapGeoPoint.location(withLatitude: latitude, longitude: longitude);
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
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        
         
         
        if response.count == 0
        {
            return;
        }
        
        for poi in response.pois
        {
            let province = poi.province == poi.city ? "" :poi.province!;
            let address = poi.district  ==  poi.address ? "":poi.address;
            let poi = [poi.name, "\(province)\(poi.city!)\(poi.district!)\(address)"]
        
        }
    }
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
