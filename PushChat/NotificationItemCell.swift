//
//  NotificationItemCell.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import UIKit

class NotificationItemCell: UITableViewCell {
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var receivedDt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func enabled()->Void{
        
        
    }
    
    func dataBind(notifcation: Notification){
        self.message.text = notifcation.message;
        let dateFormat = NSDateFormatter();
        dateFormat.dateFormat = "MM-dd-yy hh:mm a";
        self.receivedDt.text =  dateFormat.stringFromDate(notifcation.receivedDt!);
    }
}
