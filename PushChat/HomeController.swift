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
        self.setupTableView("notificationItem");
        self.dataContext = Notification.all(resultCB);
    }
    
    override func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject, indexPath: NSIndexPath, canUserInteract: Bool) -> Void{
        
        var cell = tableCell as! NotificationItemCell;
        cell.dataBind(rowData as! Notification);
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
    }
    
    @objc func subscribe() -> Void{
        var result = Notification.all(resultCB);
        self.dataContext = result;
        self.tableView.reloadData();
    }
    
    func reload(){
        var result = Notification.all(resultCB);
        self.dataContext = result;
        self.tableView.reloadData();
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailItem"){
            var detailView = segue.destinationViewController as! DetailViewController;
            var selected = self.dataContext[self.listView.indexPathForSelectedRow()!.row] as! Notification;
            detailView.dataContext = selected;
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 45;
    }
}
