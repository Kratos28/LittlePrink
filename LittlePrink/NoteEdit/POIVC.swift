//
//  POIVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/20.
//

import UIKit
import CoreLocation

class POIVC: UIViewController {

    private let locationManager = AMapLocationManager()
    private var pois = [["不显示位置",""]];
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.locationTimeout = 5;
        locationManager.reGeocodeTimeout = 5;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        
        
        
        locationManager.requestLocation(withReGeocode: false) {[weak self] location, reGeocode, error in
            if let error = error {
                let error = error as NSError
            
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    
                    
                    return;
                }else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                            || error.code == AMapLocationErrorCode.timeOut.rawValue
                            || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                            || error.code == AMapLocationErrorCode.badURL.rawValue
                            || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                            || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue
                {
                    
                }else
                {
                    
                }
                
                
                
            }

            guard let POIVC = self else{return};
            
            if let location = location
            {
                print("location:",location);
            }
            if let reGeocode = reGeocode {
                print("reGeocode:",reGeocode);
                guard let formattedAddress = reGeocode.formattedAddress,!formattedAddress.isEmpty else {return};
                let province = reGeocode.province  == reGeocode.city ? "" :reGeocode.province!;
                let currentPOI = [reGeocode.poiName!,
                                  "\(province)\(reGeocode.city!)\(reGeocode.district!)\(reGeocode.street ?? "")\(reGeocode.number ?? "")"];
                POIVC.pois.append(currentPOI);
                
                DispatchQueue.main.async {
                    POIVC.tableView.reloadData();
                }
                
            }
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
