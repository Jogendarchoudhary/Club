//
//  MembersViewController.swift
//  Club
//
//  Created by AA/MP/05 on 11/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import UIKit

class MembersViewController: ClubViewController {

    @IBOutlet weak var tableView: UITableView!
    var memberList:[Member]?
    var fullMemberList:[Member]?
    var sortOptionl = Sort.name
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Members"
        searchVC.searchBar.delegate = self
        fullMemberList = memberList
        sortData()
    }
    func sortData() {
        if sortOptionl == .name {
            fullMemberList?.sort(by: {$1.fullName > $0.fullName})
            memberList?.sort(by: {$1.fullName > $0.fullName})
        } else {
            fullMemberList?.sort(by: {$1.age ?? 0 > $0.age ?? 0})
            memberList?.sort(by: {$1.age ?? 0 > $0.age ?? 0})
        }
        tableView.reloadData()
    }
}
extension MembersViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            memberList = fullMemberList
            tableView.reloadData()
            return
        }
        memberList = fullMemberList?.filter({$0.fullName.lowercased().contains(searchText.trimmingCharacters(in:.whitespacesAndNewlines).lowercased())})
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        memberList = fullMemberList
        tableView.reloadData()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        var nameOption = "Name"
        var ageOption = "Age"
        if sortOptionl == .name {
            nameOption = "✔︎ Name";
        } else {
            ageOption = "✔︎ Age"
        }
        let actionSheet = UIAlertController(title: "Sort", message: "Please Select an option", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: nameOption, style: .default) { (alert) in
            self.sortOptionl = .name
            self.sortData()
        })
        actionSheet.addAction(UIAlertAction(title: ageOption, style: .default) { (alert) in
            self.sortOptionl = .age
            self.sortData()
        })
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler:nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension MembersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memberTableViewCellIdentifier", for: indexPath) as? MemberTableViewCell else { fatalError("Not able to create MemberTableViewCell") }
        let memberData = memberList?[indexPath.row]
        cell.memberData = memberData
        cell.setup()
        return cell
    }
    
    
}
