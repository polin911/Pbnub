//
//  ViewController.swift
//  Pbnub
//
//  Created by Polina on 10.09.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import PubNub

class ViewController: UIViewController, PNObjectEventListener {
    
    var appDel    : AppDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //////////
        func client(_ client: PubNub, didRecieveMessage message: PNMessageResult) {
            if message.data.channel != message.data.subscription {
                print("!!!!!!!!!!!\(message)")
            }
            else {
                print("!!!!!!!!!!!\(message)")
            }
            print("REcieved message: \(message.data.message) on chanel \(message.data.channel) at \(message.data.timetoken)")
        }
        func client(_ client: PubNub, didRecievePresenceEvent event: PNPresenceEventResult) {
            if event.data.channel != event.data.subscription {
                
            }
            else {
                
            }
            if event.data.presenceEvent != "state-change" {
                print("\(event.data.presence.uuid) \"\(event.data.presenceEvent)'ed\"\n" +
                    "at: \(event.data.presence.timetoken) on \(event.data.channel) " +
                    "(Occupancy: \(event.data.presence.occupancy))")
            }
            else {
                print("\(event.data.presence.uuid) \"\(event.data.presenceEvent)'ed\"\n" +
                    "at: \(event.data.presence.timetoken) on \(event.data.channel) " +
                    "(Occupancy: \(event.data.presence.occupancy))")
            }
        }
        
   // print("!!!!!\(appDel.client.)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

