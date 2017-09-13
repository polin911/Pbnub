//
//  MainVC.swift
//  Pbnub
//
//  Created by Polina on 11.09.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import PubNub

let pubKey = "pub-c-8ecaf827-b81c-4d89-abf0-d669cf6da672"
let subKey = "sub-c-a11d1bc0-ce50-11e5-bcee-0619f8945a4f"
let config = PNConfiguration(publishKey: pubKey, subscribeKey: subKey)
func createPubNubClientInstance(publishKey: String, subscribeKey: String) -> PubNub {
    let createdConfig = PNConfiguration(publishKey: publishKey, subscribeKey: subscribeKey)
    return PubNub.clientWithConfiguration(createdConfig)
}

class MainVC: UIViewController {
    
    @IBOutlet var tableViewChat: UITableView!
    
    
    var dataDownload: DownloadData!
    var chatModel   : [ChatModel]!
    
    //Publick message!
    var pubNubPublisher = PubNubPublisher(publishChannel: "antichat_hackathon")
    //Subscribe]
    var subscribeNub    = PubNubSubscribe(publishChannel: "antichat_hackathon")
    
    let exampleClient   = PubNub.clientWithConfiguration(config)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // labelTxt.text = modelTry.txtMessage
//        dataDownload.chatUpload(succes: { (chat) in
//            print(chat)
//        }) { (error) in
//            print(error)
//        }
        exampleClient.historyForChannel("antichat_hackathon", start: nil, end: nil) { (result, status) in
            
            print("\(result)")
        }
        
        func updateView() {
            tableViewChat.delegate   = self
            tableViewChat.dataSource = self
        }
        
        //exampleClient.history()
        //Publick message!
        pubNubPublisher.publish(message: "Hello ")
        
        //Subscribe
    
    }

   

}
extension MainVC: UITableViewDelegate {
    
}
extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewChat.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! CellChat
        cell.chatTxtLbl.text = chatModel[indexPath.row].message
        cell.nameLbl.text    = chatModel[indexPath.row].userName
        
        return cell
    }
}
