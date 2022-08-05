//
//  POIVC-KeywordsSearch.swift
//  LittlePrink
//
//  Created by Kratos on 2022/8/6.
//

import Foundation



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
        footer.setRefreshingTarget(self, refreshingAction: #selector(keywordsSearchPullRefresh))
        showLoadHUd();

        makeKeywordsSearch(keywords)
        
        

        
    }
 
}



extension POIVC:AMapSearchDelegate
{
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        
        let poiCount = response.count;
        self.hideLoadHUD();
        
        if poiCount > kPOIOffset
        {
            pageCount  = poiCount / kPOIOffset + 1;
            
        }else
        {
            footer.endRefreshingWithNoMoreData();
        }

        if poiCount == 0
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


extension POIVC
{
    
    @objc func makeKeywordsSearch(_ keywords: String, _ page : Int = 1)
    {
        keywordsSearchRequest.keywords = keywords;
        keywordsSearchRequest.page = page;
        mapSearch?.aMapPOIKeywordsSearch(keywordsSearchRequest);
    }

}



extension POIVC
{
    @objc func keywordsSearchPullRefresh()
    {
        currentKeywordsPage += 1;
        makeKeywordsSearch(keywords, currentKeywordsPage);
        endRefreshing(currentKeywordsPage;)
    }

}
