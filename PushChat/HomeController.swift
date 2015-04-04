//
//  HomeController.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/2/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import UIKit

class HomeController: ListViewController,UISearchBarDelegate, UISearchDisplayDelegate   {
    
    @IBOutlet weak var listView: UITableView!
    
    @IBOutlet weak var filterSearch: UISearchBar!
    var taskies:[AnyObject] = [AnyObject]();
    
    @IBAction func onRefresh(sender: AnyObject) {
        self.refreshList();
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableView = listView;
        self.prepareTableView("notificationItem");
        self.dataContext = Notification.all(resultCB);
        self.filterSearch.delegate=self;
    }
        
    override func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject, indexPath: NSIndexPath, canUserInteract: Bool) -> Void{
        
        var cell = tableCell as NotificationItemCell;
        cell.dataBind(rowData as Notification);
    }

    
    func searchBarCancelButtonClicked(searchBar: UISearchBar){
        searchBar.text = "";
        searchBar.resignFirstResponder();
        var result = Notification.all(resultCB);
        self.dataContext = result;
        self.listView.scrollEnabled=true;
        self.listView.userInteractionEnabled = true;
        isSearchOn = false;
        self.tableView.reloadData();
        self.navigationController?.setNavigationBarHidden(false, animated: true);
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder();
        var result = Notification.all(resultCB);
        self.dataContext = result;
        self.tableView.reloadData();
        self.navigationController?.setNavigationBarHidden(false, animated: true);
        self.listView.scrollEnabled=true;
        self.listView.userInteractionEnabled = true;
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar){
        println("Hello World !!!");
        searchBar.setShowsCancelButton(true, animated: true);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
        isSearchOn = true;
        self.listView.userInteractionEnabled = false;
        self.listView.scrollEnabled=false;
        self.listView.reloadData();
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar){
        searchBar.setShowsCancelButton(false, animated: true);
    }
  
    func resultCB()->Void{
//        NSNotificationCenter.defaultCenter().removeObserver(self);
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "subscribe", name: Constants.Mail, object: nil);
//        println("Callback");
    }
    
    @objc func subscribe() -> Void{
        println("Subscriber callback");
        
        var result = Notification.all(resultCB);
        self.dataContext = result;
        self.tableView.reloadData();
    }
    
    func reload(){
        println("Reloaded ...");
        var result = Notification.all(resultCB);
        self.dataContext = result;
        self.tableView.reloadData();
    }
}
