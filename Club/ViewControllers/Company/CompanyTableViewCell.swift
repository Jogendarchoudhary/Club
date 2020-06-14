//
//  CompanyTableViewCell.swift
//  Club
//
//  Created by AA/MP/05 on 14/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var websiteURL: UILabel!
    @IBOutlet weak var detailText: UILabel!
    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var membersButton: UIButton!
    @IBOutlet weak var holdingView: UIView!
    
    var company: Company?
    var memberFor: ((_ company:Company) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.systemBlue.cgColor
        followButton.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup() {
        companyName.text = company?.companyName
        websiteURL.text = company?.websiteUrl
        detailText.text = company?.about
        profileImageView.setImageWih(url: company?.logo)
        favButton.isSelected = company?.isFav ?? false
        followButton.isSelected = company?.isFollow ?? false
        followButton.backgroundColor = followButton.isSelected ? .systemBlue : .systemBackground
    }
    @IBAction func membersAction(_ sender: Any) {
        if let selectedCompany = company {
            memberFor?(selectedCompany)
        }
    }
    @IBAction func followAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        company?.isFollow = sender.isSelected
        sender.backgroundColor = sender.isSelected ? .systemBlue : .systemBackground
    }
    @IBAction func favAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        company?.isFav = sender.isSelected
    }
}

extension UIImageView {
    func setImageWih(url: String?) {
        CompanyService().downloadImageWith(url: url) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            case .failure(_):
                print("No image available")
            }
        }
    }
}
