//
//  RequestDataManager.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 2/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import Foundation

class RequestDataManager {
    
    class func requestPosting(token: String, postingId: String) {
        
        let json = JSON.init([
            
            "token" : token,
            "id" : postingId,
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/chat/request", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    class func getAllMessageGroup(token: String, onComplete: ((_: [MessageGroup]) -> Void)?) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "all",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                    let count = json!.count
                    var messageGroupList: [MessageGroup] = []
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MMM-yyyy HH:mm"
                    
                    for var i in 0 ..< count {
                        let messageGroup = MessageGroup()
                        messageGroup.messageGroupId = ((json![i]["id"].string)!)
                        messageGroup.postingId = (json![i]["postingid"].string)!
                        messageGroup.bookName = (json![i]["bookname"].string)!
                       // messageGroup.bookPhotos = (json![i]["bookphotos"].string)!
                        messageGroup.donorUserId = ((json![i]["donoruserid"].string)!)
                        messageGroup.donorUserName = ((json![i]["donorusername"].string)!)
                        messageGroup.recptUserId = ((json![i]["recptuserid"].string)!)
                        messageGroup.recptUserName = ((json![i]["recptusername"].string)!)
                        
                        if (json![i]["pendinguserid"]).isEmpty {
                            messageGroup.pendingUserId = ""
                        } else {
                            messageGroup.pendingUserId = ((json![i]["pendinguserid"].string)!)
                        }
                        
                        messageGroup.status = ((json![i]["status"].string)!)

                        if (json![i]["responsedt"].int64!) == 0 {
                            messageGroup.responseDate = "Awaiting Response"
                        }
                        else {
                            let respondLong = ((json![i]["responsedt"].int64)!)
                            let respondDate = Date(timeIntervalSince1970: Double(respondLong))
                            let respondDateString = formatter.string(from: respondDate)
                            messageGroup.responseDate = respondDateString
                        }
                        
                        let requestLong = ((json![i]["requestdt"].int64)!)
                        let requestDate = Date(timeIntervalSince1970: Double(requestLong))
                        let requestDateString = formatter.string(from: requestDate)
                        messageGroup.requestDate = requestDateString
                        
                        if (json![i]["contactemail"]).isEmpty {
                            messageGroup.contactEmail = ""
                        } else {
                            messageGroup.contactEmail = ((json![i]["contactemail"].string)!)
                        }

                        if (json![i]["contactphone"]).isEmpty {
                            messageGroup.contactPhone = ""
                        } else {
                            messageGroup.contactPhone = ((json![i]["contactphone"].string)!)
                        }
                        
                        messageGroupList.append(messageGroup)
                    }
                    onComplete?(messageGroupList)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    class func getAllPendingMessageGroup(token: String, onComplete: ((_: [MessageGroup]) -> Void)?) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "all_pending",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                    let count = json!.count
                    var messageGroupList: [MessageGroup] = []
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MMM-yyyy HH:mm"
                    
                    for var i in 0 ..< count {
                        let messageGroup = MessageGroup()
                        messageGroup.messageGroupId = ((json![i]["id"].string)!)
                        messageGroup.postingId = (json![i]["postingid"].string)!
                        messageGroup.bookName = (json![i]["bookname"].string)!
                        // messageGroup.bookPhotos = (json![i]["bookphotos"].string)!
                        messageGroup.donorUserId = ((json![i]["donoruserid"].string)!)
                        messageGroup.donorUserName = ((json![i]["donorusername"].string)!)
                        messageGroup.recptUserId = ((json![i]["recptuserid"].string)!)
                        messageGroup.recptUserName = ((json![i]["recptusername"].string)!)
                        messageGroup.pendingUserId = ((json![i]["pendinguserid"].string)!)
                        messageGroup.status = ((json![i]["status"].string)!)

                        if (json![i]["responsedt"].int64!) == 0 {
                            messageGroup.responseDate = "Awaiting Response"
                        }
                        else {
                            let respondLong = ((json![i]["responsedt"].int64)!)
                            let respondDate = Date(timeIntervalSince1970: Double(respondLong))
                            let respondDateString = formatter.string(from: respondDate)
                            messageGroup.responseDate = respondDateString
                        }
                        
                        let requestLong = ((json![i]["requestdt"].int64)!)
                        let requestDate = Date(timeIntervalSince1970: Double(requestLong))
                        let requestDateString = formatter.string(from: requestDate)
                        messageGroup.requestDate = requestDateString
                        
                        if (json![i]["contactemail"]).isEmpty {
                            messageGroup.contactEmail = ""
                        } else {
                            messageGroup.contactEmail = ((json![i]["contactemail"].string)!)
                        }
                        
                        if (json![i]["contactphone"]).isEmpty {
                            messageGroup.contactPhone = ""
                        } else {
                            messageGroup.contactPhone = ((json![i]["contactphone"].string)!)
                        }
                        
                        messageGroupList.append(messageGroup)
                    }
                    onComplete?(messageGroupList)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    class func getAllDononrMessageGroup(token: String, onComplete: ((_: [MessageGroup]) -> Void)?) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "donor",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                    let count = json!.count
                    var messageGroupList: [MessageGroup] = []
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MMM-yyyy HH:mm"
                    
                    for var i in 0 ..< count {
                        let messageGroup = MessageGroup()
                        messageGroup.messageGroupId = ((json![i]["id"].string)!)
                        messageGroup.postingId = (json![i]["postingid"].string)!
                        messageGroup.bookName = (json![i]["bookname"].string)!
                        // messageGroup.bookPhotos = (json![i]["bookphotos"].string)!
                        messageGroup.donorUserId = ((json![i]["donoruserid"].string)!)
                        messageGroup.donorUserName = ((json![i]["donorusername"].string)!)
                        messageGroup.recptUserId = ((json![i]["recptuserid"].string)!)
                        messageGroup.recptUserName = ((json![i]["recptusername"].string)!)
                        
                        if (json![i]["pendinguserid"]).isEmpty {
                            messageGroup.pendingUserId = ""
                        } else {
                            messageGroup.pendingUserId = ((json![i]["pendinguserid"].string)!)
                        }

        
                        messageGroup.status = ((json![i]["status"].string)!)
                        
                        if (json![i]["responsedt"].int64!) == 0 {
                            messageGroup.responseDate = "Awaiting Response"
                        }
                        else {
                            let respondLong = ((json![i]["responsedt"].int64)!)
                            let respondDate = Date(timeIntervalSince1970: Double(respondLong))
                            let respondDateString = formatter.string(from: respondDate)
                            messageGroup.responseDate = respondDateString
                        }
                        
                        let requestLong = ((json![i]["requestdt"].int64)!)
                        let requestDate = Date(timeIntervalSince1970: Double(requestLong))
                        let requestDateString = formatter.string(from: requestDate)
                        messageGroup.requestDate = requestDateString
                        
                        if (json![i]["contactemail"]).isEmpty {
                            messageGroup.contactEmail = ""
                        } else {
                            messageGroup.contactEmail = ((json![i]["contactemail"].string)!)
                        }
                        
                        if (json![i]["contactphone"]).isEmpty {
                            messageGroup.contactPhone = ""
                        } else {
                            messageGroup.contactPhone = ((json![i]["contactphone"].string)!)
                        }
                        
                        messageGroupList.append(messageGroup)
                    }
                    onComplete?(messageGroupList)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    class func getAllRecipientMessageGroup(token: String, onComplete: ((_: [MessageGroup]) -> Void)?) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "recipient",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                    let count = json!.count
                    var messageGroupList: [MessageGroup] = []
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MMM-yyyy HH:mm"
                    
                    for var i in 0 ..< count {
                        let messageGroup = MessageGroup()
                        messageGroup.messageGroupId = ((json![i]["id"].string)!)
                        messageGroup.postingId = (json![i]["postingid"].string)!
                        messageGroup.bookName = (json![i]["bookname"].string)!
                        // messageGroup.bookPhotos = (json![i]["bookphotos"].string)!
                        messageGroup.donorUserId = ((json![i]["donoruserid"].string)!)
                        messageGroup.donorUserName = ((json![i]["donorusername"].string)!)
                        messageGroup.recptUserId = ((json![i]["recptuserid"].string)!)
                        messageGroup.recptUserName = ((json![i]["recptusername"].string)!)
                    
                        if (json![i]["pendinguserid"]).isEmpty {
                            messageGroup.pendingUserId = ""
                        } else {
                            messageGroup.pendingUserId = ((json![i]["pendinguserid"].string)!)
                        }
                        
                        messageGroup.status = ((json![i]["status"].string)!)

                        
                        if (json![i]["responsedt"].int64!) == 0 {
                            messageGroup.responseDate = "Awaiting Response"
                        }
                        else {
                            let respondLong = ((json![i]["responsedt"].int64)!) 
                            let respondDate = Date(timeIntervalSince1970: Double(respondLong))
                            let respondDateString = formatter.string(from: respondDate)
                            messageGroup.responseDate = respondDateString
                        }
                        
                        let requestLong = ((json![i]["requestdt"].int64)!)
                        let requestDate = Date(timeIntervalSince1970: Double(requestLong))
                        let requestDateString = formatter.string(from: requestDate)
                        messageGroup.requestDate = requestDateString
                        
                        if (json![i]["contactemail"]).isEmpty {
                            messageGroup.contactEmail = ""
                        } else {
                            messageGroup.contactEmail = ((json![i]["contactemail"].string)!)
                        }
                        
                        if (json![i]["contactphone"]).isEmpty {
                            messageGroup.contactPhone = ""
                        } else {
                            messageGroup.contactPhone = ((json![i]["contactphone"].string)!)
                        }
                        
                        messageGroupList.append(messageGroup)
                    }
                    onComplete?(messageGroupList)
                }
                
            })
            
            return
        } // End of Dispatch Queue
    }
    
    
    class func messageGroupRespondAccept(token: String, messagegrpid: String, email: String, phone: String) {
        
        
        print(token)
        print(messagegrpid)
        
        let json = JSON.init([
            "token" : token,
            
            "messagegrpid" : messagegrpid,
            
            "msgtype" : "donor_accept",
            
            "msg" : "",
            
            "contactemail" : email,
            
            "contactphone" : phone
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/chat/respond", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    print(json!)
                    return
                }
                
            })
        } // End of Dispatch Queue
        
    }
    
    class func messageGroupRespondReject(token: String, messagegrpid: String, reasonForRej: String) {
        
        print(token)
        print(messagegrpid)
        
        let json = JSON.init([
            "token" : token,
            
            "messagegrpid" : messagegrpid,
            
            "msgtype" : "donor_reject",
            
            "msg" : reasonForRej
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/chat/respond", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    print(json!)
                    return
                }
                
            })
        } // End of Dispatch Queue
        
    }
    
    class func messageGroupRespondReqDismiss(token: String, messagegrpid: String) {
        
        print(token)
        print(messagegrpid)
        
        let json = JSON.init([
            "token" : token,
            
            "messagegrpid" : messagegrpid,
            
            "msgtype" : "requester_dismiss"
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/chat/respond", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    print(json!)
                    return
                }
                
            })
        } // End of Dispatch Queue
        
    }



}
