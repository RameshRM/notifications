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
//            mock();
        }
        
        callback();
        return Notifications.instance.all();
    }
    
    class func subscribe() -> Void{
        println("Subscribing to message");
        NSNotificationCenter.defaultCenter().removeObserver(self);
        //        NSNotificationCenter.defaultCenter().addObserver(Notification., selector: "subscribe", name: Constants.Mail, object: nil)
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
};