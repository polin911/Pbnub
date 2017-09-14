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
    var chatModel : [ChatModel2]!
    
    //Publick message!
    var pubNubPublisher = PubNubPublisher(publishChannel: "antichat_hackathon")
    //Subscribe]
    var subscribeNub    = PubNubSubscribe(publishChannel: "antichat_hackathon")
    
    let exampleClient   = PubNub.clientWithConfiguration(config)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        exampleClient.historyForChannel("antichat_hackathon", start: nil, end: nil) { (result, status) in
//            chatMessageArray = self.parseJson(result?.data.messages as AnyObject)

//          print("\(result?.data.messages)")
//        }
        
        ///////////////////
        
        
        
        
        func updateView() {
            tableViewChat.delegate   = self
            tableViewChat.dataSource = self
            tableViewChat.reloadData()
            updateHistory()
        }
        
        //exampleClient.history()
        //Publick message!
        pubNubPublisher.publish(message: "Hello ")
        
        //Subscribe
    
    }
    ////////////////////MARK: Update
    
    var chatMessageArray:[ChatModel2] = []
    var usersArray:[String] = []
    
    func updateHistory(){
        
        let appDel = UIApplication.shared.delegate! as! AppDelegate
        
        appDel.client.historyForChannel("antichat_hackathon", start: nil, end: nil, includeTimeToken: true, withCompletion: { (result, status) -> Void in
            self.chatMessageArray = self.parseJson(result!.data.messages as AnyObject)
            self.tableViewChat.reloadData()
            
            
        })
    }
    
    func parseJson(_ anyObj:AnyObject) -> Array<ChatModel2>{
        
        var list:Array<ChatModel2> = []
        
        if  anyObj is Array<AnyObject> {
            
            for jsonMsg in anyObj as! Array<AnyObject>{
                var json = jsonMsg["message"] as! NSDictionary
                if(json["type"] as AnyObject? as? String != "Chat"){ continue }
                var nameJson = (json["name"] as AnyObject? as? String) ?? "" // to get rid of null
                var textJson  =  (json["text"]  as AnyObject? as? String) ?? ""
                var timeJson  =  (json["time"]  as AnyObject? as? String) ?? ""
                var senderJson  =  (json["sender"]  as AnyObject? as? String) ?? ""
                var typeJson  =  (json["type"]  as AnyObject? as? String) ?? ""
                
                list.append(ChatModel2(name: nameJson, text: textJson, time: timeJson, sender: senderJson, type: typeJson))
            }
            self.tableViewChat.reloadData()
            
            
        }
        
        return list
        
    }
    
    @IBAction func uploadcheck(_ sender: Any) {
        tableViewChat.reloadData()
    }
//////////
   

}
extension MainVC: UITableViewDelegate {
    
}
extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewChat.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! CellChat
        cell.chatTxtLbl.text = chatModel[indexPath.row].text
        cell.nameLbl.text    = chatModel[indexPath.row].sender
        
        return cell
    }
}
