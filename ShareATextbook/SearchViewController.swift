//
//  SearchViewController.swift
//  ShareATextbook
//
//  Created by nat on 4/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var filteredListings = [Upload]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self as! UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
     //   tableView.tableHeaderView = searchController.searchBar
    }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        /*
        filteredListings = listings.filter {
        candy in
            return candy.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
    //    tableView.reloadData()
         */
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
