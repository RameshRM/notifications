//
//  NotificationDtl.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/20/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation


public class NotificationDtl : NSObject{
    var title: NSString?;
    var message: NSString?;
    var severity: NSString?;
    var action: NSString?;
    var id: NSInteger?;
    
    override init(){
        super.init();
    }
    

};