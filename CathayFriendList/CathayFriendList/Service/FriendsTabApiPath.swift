//
//  FriendsTabApiPath.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation

enum FriendsTabApiPath: ApiPathProtocol {
    
    case UserInfoApi
    case FriendsListOneApi
    case FirendsListTwoApi
    case FriendsListWithInvitationApi
    case NoFriendsAndInvitationApi
    
    var path: String {
        switch self {
        case .UserInfoApi:
            return "/man.json"
        case .FriendsListOneApi:
            return "/friend1.json"
        case .FirendsListTwoApi:
            return "/friend2.json"
        case .FriendsListWithInvitationApi:
            return "/friend3.json"
        case .NoFriendsAndInvitationApi:
            return "/friend4.json"
        }
    }
}
