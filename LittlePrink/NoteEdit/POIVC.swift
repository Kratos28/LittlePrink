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
    var pois = kPOIsInitArr;
    lazy var keywordsSearchRequest : AMapPOIKeywordsSearchRequest  = {
        let request = AMapPOIKeywordsSearchRequest();
        request.requireExtension = true;
        return request;
    }();
    var latitude : CLLocationDegrees = 0.0;
    var longitude : CLLocationDegrees = 0.0;
    var keywords = "";
    var aroundSearchPOIs = kPOIsInitArr;
    @IBOutlet weak var searchBar: UISearchBar!
    lazy var mapSearch = AMapSearchAPI();
    lazy  var aroundSearchRequest : AMapPOIAroundSearchRequest = {
        let reqeust = AMapPOIAroundSearchRequest();
        reqeust.location = AMapGeoPoint.location(withLatitude: latitude, longitude: longitude);
//        reqeust.types = kPOIType;
        reqeust.requireExtension = true;
        
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
        
         
        self.hideLoadHUD();
        if response.count == 0
        {
            return;
        }
        
        for poi in response.pois
        {
            let province = poi.province == poi.city ? "" :poi.province;
            let address = poi.district  ==  poi.address ? "":poi.address;
            let poi = [poi.name ?? kNoPOIPH,
                       "\(province.unwrappedText)\(poi.city.unwrappedText)\(poi.district.unwrappedText)\(address.unwrappedText)"]
            pois.append(poi);
            if request is AMapPOIAroundSearchRequest{
                aroundSearchPOIs.append(poi);
            }
        }
        tableView.reloadData();
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


extension POIVC: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
        if searchText.isEmpty
        {
            pois = aroundSearchPOIs;
            tableView.reloadData();
        }

    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true);
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text,!searchText.isBlank else {return};
        self.keywords = searchText;
        pois.removeAll();
        showLoadHUd();
        keywordsSearchRequest.keywords = keywords;
        mapSearch?.aMapPOIKeywordsSearch(keywordsSearchRequest);

        
    }
    
 
}
