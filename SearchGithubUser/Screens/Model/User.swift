//
//  User.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 23.05.24.
//

import Foundation
struct User: Decodable {
    let name: String
    let reposCount: Int
    let followers: Int
    let following: Int
    let bio: String?
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case reposCount = "public_repos"
        case image = "avatar_url"
        case followers,following, bio
    }
}
