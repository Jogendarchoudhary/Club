//
//  Member.swift
//  Club
//
//  Created by AA/MP/05 on 14/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import Foundation

class Member: Decodable {
    var _id: String?
    var age: Int?
    var email: String?
    var phone: String?
    var name: Name?
    var isFav:Bool?
    var fullName: String {
        return "\(name?.first ?? "") \(name?.last ?? "")"
    }
}
class Name: Decodable {
    var first: String?
    var last: String?
}
