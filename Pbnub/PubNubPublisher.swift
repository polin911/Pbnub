//
//  PubNubPublisher.swift
//  Pbnub
//
//  Created by Polina on 11.09.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation
import UIKit
import PubNub

class PubNubPublisher: NSObject {
    let client: PubNub
    let publishChannel: String
    
    required init(publishChannel: String) {
        self.client = createPubNubClientInstance(publishKey: pubKey, subscribeKey: subKey)
        self.publishChannel = publishChannel
        super.init()
    }
    
    func publish(message: String?) {
        guard let publishStr = message else {
            print("nothing to publish")
            return
        }
        client.publish(publishChannel, toChannel: self.publishChannel) { (status) in
            if status.isError {
                print("error pub message: \(publishStr)")
            } else {
                print("successful pub of message : \(publishStr)")
            }
        }
    }
    
   // let publisher = PubNubPublisher(publishChannel: "antichat_hackathon")
    
}
