//
//  NotificationItemCell.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import UIKit

class NotificationItemCell: UITableViewCell {
    
    
    @IBOutlet weak var alert: UILabel!
    
    @IBOutlet weak var receivedAt: UILabel!
    @IBOutlet weak var severityBadge: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func enabled()->Void{
        
        
    }
    
    func dataBind(notifcation: Notification){
        let dateFormat = NSDateFormatter();
        dateFormat.dateFormat = "MM-dd-yy hh:mm a";
        alert.text = "\(notifcation.message as! String) ";
        receivedAt.text = dateFormat.stringFromDate(notifcation.receivedDt!);
        
        if(notifcation.notificationDtl != nil){
            severityBadge.backgroundColor = severityStatus(notifcation.notificationDtl?.severity as! String);
        }
        
    }
    
    func severityStatus(severity:String)->UIColor{
        if(severity == "UNDER WATCH"){
            
        }
        switch (severity){
        case "UNDER WATCH":
            return UIColor(red: 0, green: 0, blue: 255, alpha: 0.5);
        case "NORMAL":
            return UIColor.greenColor();
        case "HIGH":
            return UIColor.orangeColor();
        case "ELEVATED":
            return UIColor.brownColor();
        case "SEVERE":
            return UIColor.redColor();
        default:
            return UIColor.blackColor();
        }
        
    }
}
