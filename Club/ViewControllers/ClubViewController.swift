//
//  ClubViewController.swift
//  Club
//
//  Created by AA/MP/05 on 11/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import UIKit

enum Sort {
    case name
    case age
}

class ClubViewController: UIViewController {
    let searchVC = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.searchController = searchVC
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchBar.showsBookmarkButton = true
        searchVC.searchBar.setImage(UIImage(named: "sort"), for: .bookmark, state: .normal)
    }
}
