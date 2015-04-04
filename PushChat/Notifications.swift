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
    
    func store(entity: Notification, callback:() -> Void) -> Void{
        allNotifications.append(entity);
    }
    
    func all()->[Notification]{

        return allNotifications;
    }
    
    func send(data: NSDictionary) -> Void{
        NSNotificationCenter.defaultCenter().postNotificationName(Constants.Mail, object: nil, userInfo: data);
    }
    
    func listen() -> Void{
        NSNotificationCenter.defaultCenter().removeObserver(self);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addNotifications:", name: Constants.Mail, object: nil)
    }
    
    func addNotifications(message: NSNotification) -> Void{
        var notificationMsg = message.userInfo!["alert"] as NSString;
        var now = NSDate();
        var notification:Notification = Notification(message: notificationMsg, description: notificationMsg, receivedDt: now);
        self.store(notification, callback: { () -> Void in
        });
        println("Adding Notification\(notificationMsg)");
    }
    
    class var  instance : Notifications{
        struct NotificationsInstance{
            static let instance = Notifications();
        }
        return NotificationsInstance.instance;
    }
    
}