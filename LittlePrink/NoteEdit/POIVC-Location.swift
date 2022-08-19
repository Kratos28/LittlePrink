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

            if let error = error {

                let error = error as NSError
            
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    
                    POIVC.hideLoadHUD();

                    return;
                }else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                            || error.code == AMapLocationErrorCode.timeOut.rawValue
                            || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                            || error.code == AMapLocationErrorCode.badURL.rawValue
                            || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                            || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue
                {
                    POIVC.hideLoadHUD();
                    return;
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
                POIVC.setAroundSearchFooter();
                
                POIVC.makeAroundSearch();
            }
            if let reGeocode = reGeocode {
                
                guard let formattedAddress = reGeocode.formattedAddress,!formattedAddress.isEmpty else {return};
                let province = reGeocode.province  == reGeocode.city ? "" :reGeocode.province;
                let currentPOI = [reGeocode.poiName ?? kNoPOIPH,
                                  "\(province.unwrappedText)\(reGeocode.city.unwrappedText)\(reGeocode.district.unwrappedText)\(reGeocode.street.unwrappedText)\(reGeocode.number.unwrappedText)"];
                POIVC.pois.append(currentPOI);
                POIVC.aroundSearchPOIs.append(currentPOI);
                DispatchQueue.main.async {
                    POIVC.tableView.reloadData();
                }
                
                
            }
        }

    }
}
extension POIVC
{
    func makeAroundSearch(_ page :Int = 1)
    {
        aroundSearchRequest.page =  page;
        mapSearch?.aMapPOIAroundSearch(aroundSearchRequest)
    }
    func setAroundSearchFooter()
    {
        footer.resetNoMoreData();
        footer.setRefreshingTarget(self, refreshingAction: #selector(aroundSearchPullToRefresh))

    }
}
extension POIVC
{
    @objc private func aroundSearchPullToRefresh()
    {
        currentAroundPage += 1;
        makeAroundSearch(currentAroundPage);
        endRefreshing(currentAroundPage);
    }
}
