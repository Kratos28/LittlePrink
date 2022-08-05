//
//  POIVC-Config.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/28.
//

import Foundation

extension POIVC{
    func config()
    {
        locationManager.locationTimeout = 5;
        locationManager.reGeocodeTimeout = 5;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        tableView.mj_footer = footer;
        
            
    }
}
