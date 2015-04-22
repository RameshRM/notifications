//
//  Notification.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class Notification : NSObject{
    var message: NSString?;
    var receivedDt: NSDate?;
    var notificationDtl: NotificationDtl?;
    var id: NSInteger?;
    
    override init(){
        super.init();
    }
    
    init(message:NSString, description: NSString, receivedDt: NSDate){
        self.message = message;
        self.receivedDt = receivedDt;
    }
    
    func save()->Void{
        Notifications.instance.store(self, callback: { () -> Void in
            println("Test");
        });
    }
    
    func addNotifications(message: NSNotification) -> Void{
        println("Adding Notifications\(message)");
    }
    

    
    
    class func all(callback:() -> Void)-> [Notification]{
        var notification:NSDictionary = ["message": "helloworld"];
        var notifications = Notifications.instance.all();
        if(notifications.count==0){
            mock();
        }
        callback();
        return Notifications.instance.all();
    }
    
    class func subscribe() -> Void{
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    class func mock()-> [Notification]{
        var notification:Notification?;
        var now = NSDate();
        notification =  Notification(message: "EP takes 50ms more, Some Long Text ... EP takes 50ms more, Some Long Text ...", description: "", receivedDt: now);
        var notificationDtl = NotificationDtl();
        notificationDtl.title = "EP Takes 50ms more";
        notificationDtl.message = "EP Team is investigating";
        notificationDtl.severity = "UNDER WATCH";
        notificationDtl.action = "App Teams must be notified";
        notification?.notificationDtl = notificationDtl;
        
        Notifications.instance.store(notification!, callback: { () -> Void in
            println("Saved");
        });
        var notifications = Notifications.instance.all();
        return notifications;
    }
};