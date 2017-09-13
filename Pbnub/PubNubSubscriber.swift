//
//  PubNubSubscriber.swift
//  Pbnub
//
//  Created by Polina on 11.09.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation
import PubNub
import UIKit
import SwiftyJSON

class PubNubSubscribe: PubNubPublisher, PNObjectEventListener {
    
    var chatModel: ChatModel!
    var modelTry :  ModelTry!
   
    
    required init(publishChannel: String) {
        super.init(publishChannel: publishChannel)
        client.addListener(self)
        client.subscribeToChannels([self.publishChannel], withPresence: false)
    }
    
    ///////////////
    var msg = "Hello Hello"
    
   
    
    func client(_ client: PubNub, didReceiveMessage message: PNMessageResult) {
        if message.data.subscription != nil {
            //modelTry.txtMessage = message.data.message as! String
        }
        else {
            
        }
        guard let recivedMessage = message.data.message else {
            print("No message payload received")
            return
        }
        print("Recived message: \(recivedMessage) on channel" + "\((message.data.subscription ?? message.data.channel)!) at time:" + "\(message.data.timetoken)")
        /////////////////////
        
//        let jsonRecive = JSON(message.data.message)
//        print(jsonRecive)
//        if jsonRecive["text"].exists() {
//            let
//        }
    }
    //////copypaste
    func client(_ client: PubNub, didReceive status: PNStatus) {
        
        if status.operation == .subscribeOperation {
            
            // Check whether received information about successful subscription or restore.
            if status.category == .PNConnectedCategory || status.category == .PNReconnectedCategory {
                
                let subscribeStatus: PNSubscribeStatus = status as! PNSubscribeStatus
                if subscribeStatus.category == .PNConnectedCategory {
                    
                    // This is expected for a subscribe, this means there is no error or issue whatsoever.
                }
                else {
                    
                    /**
                     This usually occurs if subscribe temporarily fails but reconnects. This means there was
                     an error but there is no longer any issue.
                     */
                }
            }
            else if status.category == .PNUnexpectedDisconnectCategory {
                
                /**
                 This is usually an issue with the internet connection, this is an error, handle
                 appropriately retry will be called automatically.
                 */
            }
                // Looks like some kind of issues happened while client tried to subscribe or disconnected from
                // network.
            else {
                
                let errorStatus: PNErrorStatus = status as! PNErrorStatus
                if errorStatus.category == .PNAccessDeniedCategory {
                    
                    /**
                     This means that PAM does allow this client to subscribe to this channel and channel group
                     configuration. This is another explicit error.
                     */
                }
                else {
                    
                    /**
                     More errors can be directly specified by creating explicit cases for other error categories
                     of `PNStatusCategory` such as: `PNDecryptionErrorCategory`,
                     `PNMalformedFilterExpressionCategory`, `PNMalformedResponseCategory`, `PNTimeoutCategory`
                     or `PNNetworkIssuesCategory`
                     */
                }
            }
        }
    }
}
