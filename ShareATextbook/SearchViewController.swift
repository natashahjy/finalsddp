//
//  SearchViewController.swift
//  ShareATextbook
//
//  Created by nat on 4/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var listing = [Posting]()
    var filteredListings = [Posting]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self as! UISearchResultsUpdating
        searchController.searchBar.delegate = self as! UISearchBarDelegate
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        searchController.searchBar.scopeButtonTitles=["All" , "Primary", "Secondary"]
        tableView.tableHeaderView = searchController.searchBar
    }

    func loadListing()
    {
        PostingDataManager.listAllPostings(onComplete: {
            listings in
            self.listing = listings
            
            DispatchQueue.main.async {
            }
        })
    }
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        
        filteredListings = listing.filter {
        listing in
            return listing.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
