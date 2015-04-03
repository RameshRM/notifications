//
//  Notification.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class Notification{
    var message: NSString?;
    var description: NSString?;
    var receivedDt: NSDate;
    
    init(message:NSString, description: NSString, receivedDt: NSDate){
        self.message = message;
        self.description = description;
        self.receivedDt = receivedDt;
    }
    
    func save()->Void{
        Notifications.instance.store(self, callback: { () -> Void in
            println("Test");
        });
    }
    
    class func all()-> [Notification]{
        subscribe();
        var notifications = Notifications.instance.all();
        if(notifications.count==0){
            mock();
        }
        return Notifications.instance.all();
    }
    
    class func subscribe() -> Void{
        NSNotificationCenter.defaultCenter().removeObserver(self);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "subscribe:", name: Constants.Mail, object: nil)
    }
    
    class func subscribe(message: NSNotification) -> Void{
        println(message);
    }
    
    class func mock()-> [Notification]{
        var notification:Notification?;
        var now = NSDate();
        notification =  Notification(message: "Hello World", description: "", receivedDt: now);
        Notifications.instance.store(notification!, callback: { () -> Void in
            println("Saved");
        });
        var notifications = Notifications.instance.all();
        return notifications;
    }
}