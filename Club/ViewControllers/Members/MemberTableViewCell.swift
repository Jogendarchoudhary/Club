//
//  MemberTableViewCell.swift
//  Club
//
//  Created by AA/MP/05 on 14/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var holdingView: UIView!

    var memberData:Member?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup() {
        name.text = memberData?.fullName
        email.text = memberData?.email
        phone.text = memberData?.phone
        age.text = "\(memberData?.age ?? 0)"
        favButton.isSelected = memberData?.isFav ?? false
    }
    @IBAction func favAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        memberData?.isFav = sender.isSelected
    }
}
