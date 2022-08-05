//
//  POIVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/20.
//

import UIKit
import CoreLocation

class POIVC: UIViewController {
    lazy var footer = MJRefreshAutoNormalFooter();
    lazy var locationManager = AMapLocationManager()
    var pois = kPOIsInitArr;
    lazy var keywordsSearchRequest : AMapPOIKeywordsSearchRequest  = {
        let request = AMapPOIKeywordsSearchRequest();
        request.requireExtension = true;
        
        request.offset = kPOIOffset
        return request;
    }();
    var latitude : CLLocationDegrees = 0.0;
    var longitude : CLLocationDegrees = 0.0;
    var keywords = "";
    var aroundSearchPOIs = kPOIsInitArr;
    var pageCount  = 1;
    var currentAroundPage = 1;
    var currentKeywordsPage = 1;
    
    @IBOutlet weak var searchBar: UISearchBar!
    lazy var mapSearch = AMapSearchAPI();
    lazy  var aroundSearchRequest : AMapPOIAroundSearchRequest = {
        let reqeust = AMapPOIAroundSearchRequest();
        reqeust.location = AMapGeoPoint.location(withLatitude: latitude, longitude: longitude);
        reqeust.types = kPOIType;
        reqeust.requireExtension = true;
        reqeust.offset = kPOIOffset
        
        return reqeust;
    }();
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config();
        requestLoaction();
        
        
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

extension POIVC
{
    func endRefreshing(_ currentPage : Int)
    {
        if currentPage < pageCount
        {
            footer.endRefreshing();
        }else
        {
            footer.endRefreshingWithNoMoreData();
        }
    }
}


