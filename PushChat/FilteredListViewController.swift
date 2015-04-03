//
//  FilteredListViewController.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
import UIKit;

class FilteredListViewController : ListViewController, UISearchBarDelegate, UISearchDisplayDelegate, SearchBarProtocol{
    
    var filterSearch: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        filterSearch.delegate=self;
    }
    
    func filteredSearchOn(searchText: NSString) -> Void{
        
    }
    
    func filteredSearchOff() -> Void{
        
    }
    
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar){
        println("Cancelled");
        cancelSearchBar();
        self.filteredSearchOff();
        self.navigationController?.setNavigationBarHidden(false, animated: true);
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        cancelSearchBar();
        self.filteredSearchOn(searchBar.text);
        self.tableView.reloadData();
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar){
        searchBar.setShowsCancelButton(true, animated: true);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
        isSearchOn = true;
        self.disableUserInteractionForTable();
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar){
        searchBar.setShowsCancelButton(false, animated: true);
    }
    
    
    private func cancelSearchBar(){
        
        self.filterSearch.text = "";
        self.filterSearch.resignFirstResponder();
    }
}