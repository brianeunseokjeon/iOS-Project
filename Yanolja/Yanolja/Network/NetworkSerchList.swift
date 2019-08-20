//
//  NetworkSerchList.swift
//  Yanolja
//
//  Created by brian은석 on 05/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

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
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription)}
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode ,
            response.mimeType == "application/json"
            else { return print("StatusCode is not valid")}
        guard let data = data else {
            return print("Error: did not receive data")
        }
        singleTon.saveDetailSearchList.removeAll()
        do {
            let regionData = try JSONDecoder().decode([StayListElement].self, from: data)
            singleTon.saveDetailSearchList = regionData
        } catch {
            print(error.localizedDescription)
        }
        
        completion()
    }
    task.resume()
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
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription)}
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode ,
            response.mimeType == "application/json"
            else { return print("StatusCode is not valid")}
        guard let data = data else {
            return print("Error: did not receive data")
        }
       singleTon.saveRegionSearchList.removeAll()
        do {
            let regionData = try JSONDecoder().decode([StayListElement].self, from: data)
            singleTon.saveRegionSearchList = regionData
        } catch {
            print(error.localizedDescription)
        }
        
        completion()
    }
    task.resume()
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
  
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else {
            print(error!.localizedDescription)
            return
        }
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode ,
            response.mimeType == "application/json"
            else {
   // FIXME: - //예약이 불가능할경우 역기로 들어옴..;;
                completion(false)
                print("StatusCode is not valid")
                return
        }
        guard let data = data else {
            print("Error: did not receive data")
            return
        }
        guard let statusOfResereved = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            print("Could not get parsed data")
            return
        }
        print(response.statusCode) // print 201 나옴.
        guard let boolValue = statusOfResereved["reserved"] as? Bool else {
            return print("오류")
        }
        print(boolValue,"예약완료")
        completion(boolValue)
    }
    task.resume()
}
