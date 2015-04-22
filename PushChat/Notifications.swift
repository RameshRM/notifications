//
//  Notifications.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class Notifications : NSObject{
    
    var allNotifications:[Notification] = [];
    
    private override init(){
        super.init();
        listen();
    }
    
    private func isExists(notificationId: NSInteger)->Bool{
        if(allNotifications.count <= 0){
            return false;
        }
        
        var notifications = allNotifications;
        var filtered  = notifications.filter { (T) -> Bool in
            T.id == notificationId
        };
        return filtered.count > 0 ? true : false;
    }
    
    func store(entity: Notification, callback:() -> Void) -> Void{
        //Check Duplicates ...
        //        println(entity == nil);
        //        if(isExists(entity.id!)){
        //            return;
        //        }
        //
        var temp:[Notification] = allNotifications;
        //**Store in latest Chronological Order **/
        
        if(allNotifications.count>0){
            allNotifications.removeAll(keepCapacity: false);
            allNotifications.append(entity);
            for n in temp{
                allNotifications.append(n);
            }
        }else{
            allNotifications.append(entity);
        }
    }
    
    func all()->[Notification]{
        
        return allNotifications;
    }
    
    func send(data: NSDictionary, notificationDtl: NSDictionary) -> Void{
        var userNotification = NSMutableDictionary();
        userNotification.setObject(data["alert"]!, forKey: "alert");
        userNotification.setObject(data["alert"]!, forKey: "message");
        userNotification.setObject(notificationDtl["title"]!, forKey: "title");
        userNotification.setObject(notificationDtl["severity"]!, forKey: "severity");
        userNotification.setObject(notificationDtl["action"]!, forKey: "action");
        userNotification.setObject(notificationDtl["id"]!, forKey: "id");
        NSNotificationCenter.defaultCenter().postNotificationName(Constants.Mail as String, object: nil, userInfo: userNotification as [NSObject : AnyObject]);
    }
    
    func listen() -> Void{
        NSNotificationCenter.defaultCenter().removeObserver(self);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addNotifications:", name: Constants.Mail as String, object: nil)
    }
    
    func addNotifications(message: NSNotification) -> Void{
        var notificationMsg = message.userInfo!["message"] as! NSString;
        var now = NSDate();
        var notification:Notification = Notification(message: notificationMsg, description: notificationMsg, receivedDt: now);
        var notificationDtl = NotificationDtl();
        notificationDtl.title = message.userInfo!["title"] as! NSString;
        notificationDtl.message = notificationMsg;
        notificationDtl.severity = message.userInfo!["severity"] as! NSString;
        notificationDtl.action = message.userInfo!["action"] as! NSString;
        notification.notificationDtl = notificationDtl;
        
        self.store(notification, callback: { () -> Void in
        });
    }
    
    class var  instance : Notifications{
        struct NotificationsInstance{
            static let instance = Notifications();
        }
        return NotificationsInstance.instance;
    }
    
}