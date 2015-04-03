//
//  Notifications.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class Notifications{
    
    var allNotifications:[Notification] = [];
    
    private init(){
    
    }

    func store(entity: Notification, callback:() -> Void) -> Void{
        allNotifications.append(entity);
    }
    
    func all()->[Notification]{
        return allNotifications;
    }
    
    class var  instance : Notifications{
        struct NotificationsInstance{
            static let instance = Notifications();
        }
        return NotificationsInstance.instance;
    }

}