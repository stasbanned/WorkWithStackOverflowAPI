//
//  Stat.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 07.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import Foundation

struct Stat: Decodable {
    let items: [Items]
}

struct Items: Decodable {
    //        let creation_date: Int
    //        let last_activity_date: Int
    let link: URL
    let owner: Owner
    let question_id: Int
    let tags: [String]
    let title: String
}

struct Owner: Decodable {
    let display_name: String
    let link: URL
    let user_id: Int
}
