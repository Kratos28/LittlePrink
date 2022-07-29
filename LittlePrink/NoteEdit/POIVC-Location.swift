//
//  POIVC-Location.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/28.
//

import Foundation
extension POIVC
{
    func requestLoaction()
    {
        
        showLoadHUd()
        
        locationManager.requestLocation(withReGeocode: false) {[weak self] location, reGeocode, error in
            guard let POIVC = self else{return};
            POIVC.hideLoadHUD();

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
                POIVC.latitude =  location.coordinate.latitude;
                POIVC.longitude =  location.coordinate.longitude;
                //检索周边POI
                POIVC.mapSearch?.aMapPOIAroundSearch(POIVC.aroundSearchRequest);
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
