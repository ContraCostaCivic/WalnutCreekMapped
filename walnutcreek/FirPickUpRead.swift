//
//  File.swift
//  walnutcreek
//
//  Created by Lewis Black on 03/03/2018.
//  Copyright © 2018 Lewis Black. All rights reserved.
//

import Foundation

class FirPickUp{

//    
//    static func getDevelopments(id: String, onChange:@escaping (Message) -> ()){
//        let messageRef = C.firebaseRef.child(id).child(C.GAME.MESSAGES)
//        let messageQuery = messageRef.queryLimited(toLast:50)
//        messageQuery.observe(.childAdded, with: { (snapshot) -> Void in
//            // 3
//            let messageData = snapshot.value as! Dictionary<String, String>
//            
//            if let id = messageData[C.GAME.MESSAGE.USERID] as String!,
//                let name = messageData[C.GAME.MESSAGE.USERNAME] as String!,
//                let text = messageData[C.GAME.MESSAGE.MESSAGE] as String!,
//                text.count > 0 {
//                let message = Message(userName: name, message: text, userID: id)
//                onChange(message)
//            } else {
//                print("Error! Could not decode message data")
//            }
//        })
//    }
    
    static func observeMessagesOfGame(id: String, onChange:@escaping (Message) -> ()){
        let messageRef = C.firebaseRef.child(id).child(C.GAME.MESSAGES)
        let messageQuery = messageRef.queryLimited(toLast:50)
        messageQuery.observe(.childAdded, with: { (snapshot) -> Void in
            // 3
            let messageData = snapshot.value as! Dictionary<String, String>
            
            if let id = messageData[C.GAME.MESSAGE.USERID] as String!,
                let name = messageData[C.GAME.MESSAGE.USERNAME] as String!,
                let text = messageData[C.GAME.MESSAGE.MESSAGE] as String!,
                text.count > 0 {
                let message = Message(userName: name, message: text, userID: id)
                onChange(message)
            } else {
                print("Error! Could not decode message data")
            }
        })
    }
    
    static func write(message:Message, inGame id: String){
        
        let messageDict = [C.GAME.MESSAGE.USERNAME: message.userName,
                           C.GAME.MESSAGE.USERID: message.userID,
                           C.GAME.MESSAGE.MESSAGE: message.message
            ] as [String : Any]
        
        let pickUp = C.firebaseRef.child(id).child(C.GAME.MESSAGES).childByAutoId().setValue(messageDict)
    }
    
    
    static func getAllDevs(onSuccess: @escaping ([Development]) -> ()){
        
        C.firebaseRef.child("this").observe(.value) { (snapshot) in
            guard let snap = snapshot.value as? [String:Any] else {print("noooo")
                return}
            guard let sna = snap as? [String:[String:Any]] else {print("noooo1")
                return}

            var devs:[Development] = []
            for (key,value) in sna {
                if let lat = value["latitude"] as? Double,
                    let long = value["longitude"] as? Double,
                    let url = value["picture"] as? String,
                    let address = value["address"] as? String,
                    let status = value["status"] as? String,
                    let type = value["type"] as? String,
                    let picURL = URL(string: url)
                {
                    
                    let point = Development(name: key, latitude: lat, longitude: long, picURL: picURL, address: address, status: status, type: type)
                    
                    devs.append(point)
                }
                
                
            }
            print("yes")
            onSuccess(devs)
        }
    }
        
    
}


