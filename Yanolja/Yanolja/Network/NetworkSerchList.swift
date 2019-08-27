//
//  NetworkSerchList.swift
//  Yanolja
//
//  Created by brian은석 on 05/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation
import Alamofire

// 돋보기 눌렀을때 서치할 수 있는
func detailRegionSearch(searchKeyword:String, personnel:Int,requestCheckIn:String,requestCheckOut:String,filter:String="",category:String="" ,completion: @escaping () -> ()) {
    let todoEndpoint = "http://api.yanoljamvp.com/api/stay/"
    let query = "searchKeyword=\(searchKeyword)&personnel=\(personnel)&requestCheckIn=\(requestCheckIn)&requestCheckOut=\(requestCheckOut)&\(filter)=\(filter)&category=\(category)"
    var urlComp = URLComponents(string: todoEndpoint)
    urlComp?.query = query
    guard let url = urlComp?.url else {
        print("Error: cannot create URL")
        return
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    singleTon.saveDetailSearchList.removeAll()
    AF.request(url, method: .get)
        .validate()
        .response(completionHandler: { (response) in
            guard let data = response.data else {return print("data error") }
            do {
                let regionData = try JSONDecoder().decode([StayListElement].self, from: data)
                singleTon.saveDetailSearchList = regionData
            } catch {
                print(error.localizedDescription)
            }
            completion()
        })
   
}

// 지역 버튼 눌렀을때 가능..

func regionSearch(selectRegion:String, category:String,personnel:Int,requestCheckIn:String,requestCheckOut:String,filter:String="" ,completion: @escaping () -> ()) {
    let todoEndpoint = "http://api.yanoljamvp.com/api/stay/"
    let query = "selectRegion=\(selectRegion)&category=\(category)&personnel=\(personnel)&requestCheckIn=\(requestCheckIn)&requestCheckOut=\(requestCheckOut)&\(filter)=\(filter)"
    var urlComp = URLComponents(string: todoEndpoint)
    urlComp?.query = query
    guard let url = urlComp?.url else {
        print("Error: cannot create URL")
        return
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    singleTon.saveRegionSearchList.removeAll()

    AF.request(url, method: .get)
        .validate()
        .response(completionHandler: { (response) in
            guard let data = response.data else {return print("data error") }
            do {
                let regionData = try JSONDecoder().decode([StayListElement].self, from: data)
                singleTon.saveRegionSearchList = regionData
            } catch {
                print(error.localizedDescription)
            }
            completion()
        })
}


func reserve(roomNumber:Int,booker:String, phoneNumber:String, wayToGo:String, requestCheckIn:String,requestCheckOut:String,requestHours:Bool,requestDays:Bool,finalPrice:Int, completion: @escaping (Bool) -> ()) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "http://api.yanoljamvp.com/api/stay/room/\(roomNumber)/reservation/create/"
    let urlComp = URLComponents(string: todoEndpoint)
    
    guard let url = urlComp?.url else {
        return print("Error: cannot create URL")
    }
    let body = "booker=\(booker)&phoneNumber=\(phoneNumber)&wayToGo=\(wayToGo)&requestCheckIn=\(requestCheckIn)&requestCheckOut=\(requestCheckOut)&requestHours=\(requestHours)&requestDays=\(requestDays)&finalPrice=\(finalPrice)".data(using: String.Encoding.utf8, allowLossyConversion: false)
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = body
    
 // FIXME: -토큰이 문제임..ㅠㅠ
    urlRequest.addValue("Token 2242861fd6fe94d2a2ea809e6eb57a07ed1ea8d5", forHTTPHeaderField: "Authorization")
  
    AF.request(urlRequest).validate().responseData { (response) in
        guard let data = response.data else {return print("data error")}
        guard let statusOfResereved = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            print("Could not get parsed data")
            return
        }
        guard let boolValue = statusOfResereved["reserved"] as? Bool else {
            return completion(false)
        }
        print(boolValue,"예약완료")
        completion(boolValue)
        
    }
}

//alamofire 다시적용!
