//
//  FriendModel.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation


struct FriendModel: Decodable {
    let name: String
    let status: Int
    let isTop: String
    let fid: String
    let updateDate: String
}
