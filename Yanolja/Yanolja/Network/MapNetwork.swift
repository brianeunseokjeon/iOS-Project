//
//  MapNetwork.swift
//  Yanolja
//
//  Created by Chunsu Kim on 08/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation
import Alamofire

class MapSearch {
    
    static let shared = MapSearch()
    private init() {}
    
    var currentAddress: String = ""
    var mapSearchList = [StayListElement]()
    
    
    func currentRegionSearch(currentAddress:String, personnel:Int,requestCheckIn:String,requestCheckOut:String ,completion: @escaping () -> ()) {
        let todoEndpoint = "http://api.yanoljamvp.com/api/stay/"
        let query = "currentAddress=\(currentAddress)&personnel=\(personnel)&requestCheckIn=\(requestCheckIn)&requestCheckOut=\(requestCheckOut)"
        var urlComp = URLComponents(string: todoEndpoint)
        urlComp?.query = query
        guard let url = urlComp?.url else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        singleTon.saveRegionSearchList.removeAll()

        AF.request(urlRequest).validate().responseData { (res) in
            guard let data = res.data else {
                return print("error::")
            }
            do {
                let regionData = try JSONDecoder().decode([StayListElement].self, from: data)
                singleTon.saveRegionSearchList = regionData
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
