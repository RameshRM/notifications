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
        notification =  Notification(message: "My question essentially boils down to the best way to support dynamic heights of UILabel's (and I suppose other elements) in a UITableCell, and also correctly resize the label width/height and cell heights when rotating", description: "", receivedDt: now);
        Notifications.instance.store(notification!, callback: { () -> Void in
            println("Saved");
        });
        var notifications = Notifications.instance.all();
        return notifications;
    }
};