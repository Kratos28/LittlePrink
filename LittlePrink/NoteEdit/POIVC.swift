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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.locationTimeout = 5;
        locationManager.reGeocodeTimeout = 5;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        
        
        
        locationManager.requestLocation(withReGeocode: false) { location, reGeocode, error in
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

        
            
            if let location = location
            {
                print("location:",location);
            }
            if let reGeocode = reGeocode {
                print("reGeocode:",reGeocode);

            }
        }
    }
    
    
    
    
    
    

}
extension POIVC:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell();
    }
    
    
}


extension POIVC:UITableViewDelegate
{
    
}
