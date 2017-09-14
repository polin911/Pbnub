//
//  DownloadData.swift
//  Pbnub
//
//  Created by Polina on 12.09.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation
import SwiftyJSON
import PubNub

class DownloadData {
    
    let urlLink = "https://pubsub.pubnub.com/v2/history/sub-key/sub-c-a11d1bc0-ce50-11e5-bcee-0619f8945a4f/channel/antichat_hackathon?deviceid=6D8F8F8C-5C10-48A8-B6DF-05E69577BE00&reverse=false&count=100&uuid=984A8E13-4271-4164-A834-FC476AD4FBA0&pnsdk=PubNub-ObjC-iOS%2F4.5.5&include_token=false&requestid=C4CFDEF5-2B40-4AD5-A77C-7C65E5C2DB32&instanceid=8DCA9EBD-9FE9-4D2C-BCF4-0E3562EC3422"
    let urlLink2 = "http://pubsub.pubnub.com"
    
    func loadData() -> [ChatModel] {
        let url = URL(string: urlLink)!
        let url2 = URL(string: urlLink2)!
        
        let session = URLSession(configuration: .default)
        
        let data = try! Data(contentsOf: url2)
        
        var chatM = [ChatModel]()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let task = session.dataTask(with: url) { (data, response, error) in
            print("data\(data), response:\(response), error \(error)")
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            guard error == nil else {
                print("error\(error)")
                return
            }
            guard let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode == 200,
                let jsonData = data else {
                    print("error server response")
                    return
            }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
                print("error jsonObject")
                return
            }
//        for jsonObject in
            
        
    }
        return []
    }
    
    
//        func uploadChatData(from dictionary: [String: Any]) -> [ChatModel] {
//            guard let channelName = dictionary["channelName"] as? [String: Any] else {
//                return []
//            }
//            guard let sender = dictionary["sender"] as? [String: Any] else {
//                return []
//            }
//            guard let text = dictionary["text"] as? [String: Any] else {
//                return []
//            }
//            guard let timetoken = dictionary["timetoken"] as? [String: Any] else {
//                return []
//            }
//            var result = [ChatModel]
//        
//            
//        }
    
    
    
    
    
    
//    var chatModel: [ChatModel]!
//    
//    func parseJson(anyObj: AnyObject) -> Array<ChatModel> {
//        var list:Array<ChatModel> = []
//        if anyObj is Array<AnyObject> {
//            for jsonMsg in anyObj as! Array<AnyObject> {
//                var json = jsonMsg["mrssage"] as! NSDictionary
//                
//            }
//        }
//    }
//
//    let session = URLSession(configuration: .default)
//    
//    func chatUpload(succes: @escaping(([ChatModel])-> Void), failure: @escaping ((Error) -> Void)) {
//        
//        let url = URL(string: urlLink)!
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        let task = session.dataTask(with: url) { (data, response, error) in
//            print("data\(data), response:\(response), error \(error)")
//            
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            guard error == nil else{
//                return
//            }
//            
//            guard let serverResponse = response as? HTTPURLResponse,
//            serverResponse.statusCode == 200,
//                let jsonData = data else {
//                    return
//            }
//            guard let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []),
//            let dictionary = jsonObj as? [String:Any]
//            else {
//                return
//            }
//            
//        }
//    }
    
//    private func buildChat(from dictionary: [String: Any]) -> [ChatModel] {
//        guard let
//    }
    
}

