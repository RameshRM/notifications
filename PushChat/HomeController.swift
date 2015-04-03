//
//  HomeController.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/2/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import UIKit

class HomeController: FilteredListViewController{
    
    @IBOutlet weak var listView: UITableView!
    
    var taskies:[AnyObject] = [AnyObject]();
    @IBAction func onRefresh(sender: AnyObject) {
        
        self.refreshList();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableView = listView;
        self.prepareTableView("notificationItem");
        self.dataContext = Notification.all();
        filterSearch.delegate=self;
    }
        
    override func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject, indexPath: NSIndexPath, canUserInteract: Bool) -> Void{
        
        var cell = tableCell as NotificationItemCell;
        cell.dataBind(rowData as Notification);
    }

}
