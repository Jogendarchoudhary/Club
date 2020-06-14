//
//  CompanyListViewController.swift
//  Club
//
//  Created by AA/MP/05 on 11/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import UIKit

class CompanyListViewController: ClubViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fetchedCompanyList = [Company]()
    var companyList = [Company](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Companies"
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        searchVC.searchBar.delegate = self
        fetchCompanyData()
    }
    func fetchCompanyData() {
        CompanyService().fetchCompanyListing { [weak self] result in
            switch result {
            case .success(let companyData):
                let sortedData = companyData.sorted(by: {$1.companyName ?? "" > $0.companyName ?? ""})
                self?.fetchedCompanyList = sortedData
                self?.companyList = sortedData
            case .failure(_):
                print("No data available")
            }
        }
    }
    func memberFor(company: Company ){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "membersVCStoryBoardID") as? MembersViewController else {
            return
        }
        vc.memberList = company.members
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension CompanyListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            companyList = fetchedCompanyList
            return
        }
        companyList = fetchedCompanyList.filter({(($0.companyName?.uppercased() ?? "").contains(searchText.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()))})
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        companyList = fetchedCompanyList
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        let actionSheet = UIAlertController(title: "Sort", message: "Please Select an option", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "✔︎ Company Name", style: .default , handler:nil))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler:nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension CompanyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "companyTableViewCellIdentifier", for: indexPath) as? CompanyTableViewCell else { fatalError("Not able to create CompanyTableViewCell") }
        let companyData = companyList[indexPath.row]
        cell.company = companyData
        cell.setup()
        cell.memberFor = memberFor(company:)
        return cell
    }
    
    
}
