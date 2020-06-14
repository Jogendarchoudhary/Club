//
//  ClubViewController.swift
//  Club
//
//  Created by AA/MP/05 on 11/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import UIKit

// Enum for sorting
enum Sort {
    case name
    case age
}

class ClubViewController: UIViewController {
    
    // Adding common search view controller for company list and member list
    let searchVC = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Added navigationItem searchController
        self.navigationItem.searchController = searchVC
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchVC.obscuresBackgroundDuringPresentation = false
        
        // Using search bar bookmark button as a sorting button
        searchVC.searchBar.showsBookmarkButton = true
        searchVC.searchBar.setImage(UIImage(named: "sort"), for: .bookmark, state: .normal)

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
