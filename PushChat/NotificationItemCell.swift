//
//  NotificationItemCell.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import UIKit

class NotificationItemCell: UITableViewCell {
    
    @IBOutlet weak var message: UITextView!
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
        message.text = "\(notifcation.message) at \(dateFormat.stringFromDate(notifcation.receivedDt!))";
    }
}
