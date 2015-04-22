//
//  ListViewController.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/2/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

import UIKit

class ListViewController: MainViewController,UITableViewDelegate, UITableViewDataSource {
    var isSearchOn:Bool = false;
    var tableView: UITableView!
    
    var itemCellIdentifier : NSString = "";
    var dataContext: [AnyObject] = [] {
        willSet(newData){
        }
        didSet{
            
        }
    };
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataContext.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell();
        cell = self.tableView.dequeueReusableCellWithIdentifier(itemCellIdentifier as String) as! UITableViewCell;
        self.onCellForRowIndexSet(cell, rowData: dataContext[indexPath.row], indexPath: indexPath, canUserInteract: isSearchOn);
        return cell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    
    func setupTableView(itemCellId: NSString) {

        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.itemCellIdentifier = itemCellId;
    }

    
//   override func prepareTableView(tableView: UITableView)-> Void{
//        self.tableView = tableView;
//        self.tableView.delegate = self;
//        self.tableView.dataSource = self;
//    }
    
    
    func getNumberOfRows() -> Int{
        return dataContext.count;
    }
    
    /** Empty Stub**/
    /** Derived Class Should Implement **/
    func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject, indexPath: NSIndexPath) -> Void{
        
        
    }
    
    func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject,
        indexPath: NSIndexPath, canUserInteract: Bool) -> Void{
    }
    
    func disableUserInteractionForTable(){
        self.tableView.scrollEnabled=false;
        self.tableView.userInteractionEnabled = false;
        
    }
    
    
    func enableUserInteractionForTable(){
        self.tableView.scrollEnabled=true;
        self.tableView.userInteractionEnabled = true;
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle{
        return UITableViewCellEditingStyle.Delete;
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String!{
        return "Done";
    }
    
    func refreshList() -> Void{
        self.tableView.reloadData();
    }
    
    private func addRefresh()->Void{
        var refreshButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: Selector("onRefresh"));
        self.navigationItem.setLeftBarButtonItem(refreshButton, animated: true);
        
    }
    

    
    private func addToolbar(barButtonStyle: UIBarButtonItemStyle, position: NSString){
        
    }
 
}
