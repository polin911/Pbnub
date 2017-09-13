//
//  ChatModel.swift
//  Pbnub
//
//  Created by Polina on 12.09.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation

struct ChatModel {
    
    var message: String
    var userName: String
    var text: String
    var timetoken: Int
    var sender: String
    var channelName: String
    
    
    init?(json:[String:Any]) {
        guard let message     = json["message"]     as? String,
              let userName    = json["userName"]    as? String,
              let text        = json["text"]        as? String,
              let timetoken   = json["timetoken"]   as? Int,
              let sender      = json["sender"]      as? String,
              let channelName = json["channelName"] as? String
            else {
                return nil
        }
        self.message     = message
        self.userName    = userName
        self.text        = text
        self.timetoken   = timetoken
        self.sender      = sender
        self.channelName = channelName
    }
    
    
    
    
}
