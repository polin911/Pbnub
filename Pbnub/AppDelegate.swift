//
//  AppDelegate.swift
//  Pbnub
//
//  Created by Polina on 10.09.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import CoreData
import PubNub

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PNObjectEventListener {

    let client: PubNub
    var window: UIWindow?

    override init() {
        let config = PNConfiguration(publishKey: pubKey, subscribeKey: subKey)
        self.client = PubNub.clientWithConfiguration(config)
        super.init()
    }

    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        let configuration = PNConfiguration(publishKey: "pub-c-8ecaf827-b81c-4d89-abf0-d669cf6da672", subscribeKey: "sub-c-a11d1bc0-ce50-11e5-bcee-0619f8945a4f")
//        self.client = PubNub.clientWithConfiguration(configuration)
//        self.client.addListener(self)
//        
//        self.client.subscribeToChannels(["antichat_hackathon"], withPresence: true)
        
//        func client(_ client: PubNub, didRecieveMessage message: PNMessageResult) {
//            if message.data.channel != message.data.subscription {
//                print("!!!!!!!!!!!\(message)")
//            }
//            else {
//                
//            }
//            print("REcieved message: \(message.data.message) on chanel \(message.data.channel) at \(message.data.timetoken)")
//        }
//        func client(_ client: PubNub, didRecievePresenceEvent event: PNPresenceEventResult) {
//            if event.data.channel != event.data.subscription {
//                
//            }
//            else {
//                
//            }
//            if event.data.presenceEvent != "state-change" {
//                print("\(event.data.presence.uuid) \"\(event.data.presenceEvent)'ed\"\n" +
//                    "at: \(event.data.presence.timetoken) on \(event.data.channel) " +
//                    "(Occupancy: \(event.data.presence.occupancy))")
//            }
//            else {
//                print("\(event.data.presence.uuid) \"\(event.data.presenceEvent)'ed\"\n" +
//                    "at: \(event.data.presence.timetoken) on \(event.data.channel) " +
//                    "(Occupancy: \(event.data.presence.occupancy))")
//            }
//        }
//        func client(_ client: PubNub, didReceive status: PNStatus) {
//            
//            if status.operation == .subscribeOperation {
//                
//                // Check whether received information about successful subscription or restore.
//                if status.category == .PNConnectedCategory || status.category == .PNReconnectedCategory {
//                    
//                    let subscribeStatus: PNSubscribeStatus = status as! PNSubscribeStatus
//                    if subscribeStatus.category == .PNConnectedCategory {
//                        
//                        // This is expected for a subscribe, this means there is no error or issue whatsoever.
//                        
//                        // Select last object from list of channels and send message to it.
//                        let targetChannel = client.channels().last!
//                        client.publish("Hello from the PubNub Swift SDK", toChannel: targetChannel,
//                                       compressed: false, withCompletion: { (publishStatus) -> Void in
//                                        
//                                        if !publishStatus.isError {
//                                            
//                                            // Message successfully published to specified channel.
//                                        }
//                                        else {
//                                            
//                                            /**
//                                             Handle message publish error. Check 'category' property to find out
//                                             possible reason because of which request did fail.
//                                             Review 'errorData' property (which has PNErrorData data type) of status
//                                             object to get additional information about issue.
//                                             
//                                             Request can be resent using: publishStatus.retry()
//                                             */
//                                        }
//                        })
//                    }
//                    else {
//                        
//                        /**
//                         This usually occurs if subscribe temporarily fails but reconnects. This means there was
//                         an error but there is no longer any issue.
//                         */
//                    }
//                }
//                else if status.category == .PNUnexpectedDisconnectCategory {
//                    
//                    /**
//                     This is usually an issue with the internet connection, this is an error, handle
//                     appropriately retry will be called automatically.
//                     */
//                }
//                    // Looks like some kind of issues happened while client tried to subscribe or disconnected from
//                    // network.
//                else {
//                    
//                    let errorStatus: PNErrorStatus = status as! PNErrorStatus
//                    if errorStatus.category == .PNAccessDeniedCategory {
//                        
//                        /**
//                         This means that PAM does allow this client to subscribe to this channel and channel group
//                         configuration. This is another explicit error.
//                         */
//                    }
//                    else {
//                        
//                        /**
//                         More errors can be directly specified by creating explicit cases for other error categories 
//                         of `PNStatusCategory` such as: `PNDecryptionErrorCategory`,  
//                         `PNMalformedFilterExpressionCategory`, `PNMalformedResponseCategory`, `PNTimeoutCategory`
//                         or `PNNetworkIssuesCategory`
//                         */
//                    }
//                }
//            }
     //   }
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Pbnub")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

