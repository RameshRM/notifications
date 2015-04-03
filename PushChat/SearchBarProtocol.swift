//
//  SearchBarProtocol.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/2/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

import Foundation
import UIKit;

@objc protocol  SearchBarProtocol{
    func filteredSearchOn(searchText: NSString) -> Void;
    func filteredSearchOff()->Void;
    
    //    func searchBarCancelButtonClicked(searchBar: UISearchBar){
    //    searchBar.text = "";
    //    searchBar.resignFirstResponder();
    //    var result = TaskyModel.mockTasks();
    //    self.dataContext = result;
    //    self.taskyList.scrollEnabled=true;
    //    self.taskyList.userInteractionEnabled = true;
    //    isSearchOn = false;
    //    self.tableView.reloadData();
    //    self.navigationController?.setNavigationBarHidden(false, animated: true);
    //    }
    //
    //
    //    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    //    searchBar.resignFirstResponder();
    //    var result = TaskyModel.mockTasks(searchBar.text);
    //    self.dataContext = result;
    //    self.tableView.reloadData();
    //    }
    //
    //    func searchBarTextDidBeginEditing(searchBar: UISearchBar){
    //    searchBar.setShowsCancelButton(true, animated: true);
    //    self.navigationController?.setNavigationBarHidden(true, animated: true);
    //    isSearchOn = true;
    //    self.taskyList.userInteractionEnabled = false;
    //    self.taskyList.scrollEnabled=false;
    //    self.taskyList.reloadData();
    //    }
    //
    //    func searchBarTextDidEndEditing(searchBar: UISearchBar){
    //    searchBar.setShowsCancelButton(false, animated: true);
    //    }
    
}