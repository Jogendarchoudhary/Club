//
//  Company.swift
//  Club
//
//  Created by AA/MP/05 on 14/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import Foundation

class Company: Decodable {
    var id: String?
    var companyName: String?
    var websiteUrl: String?
    var logo: String?
    var about: String?
    var members: [Member]?
    var isFav:Bool?
    var isFollow:Bool?
    
    enum CodingKeys: String, CodingKey {
        case logo , about, members
        case companyName = "company"
        case websiteUrl = "website"
        case id = "_id"
    }
}
