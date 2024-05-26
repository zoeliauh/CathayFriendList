//
//  PagesFactory.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit


class PagesFactory {
    
    func createNoFriendsViewController() -> NoFriendsViewController {
        let vc = NoFriendsViewController()
        vc.navigationItem.title = PageCategories.NoFriends.rawValue
        vc.view.backgroundColor = .red
        return vc
    }
    
    func createOnlyFriendListViewController() -> OnlyFriendListViewController {
        let vc = OnlyFriendListViewController()
        vc.navigationItem.title = PageCategories.OnlyFriendList.rawValue
        vc.view.backgroundColor = .yellow
        return vc
    }
    
    func createFriendListWithInvitationViewController() -> FriendListWithInvitationViewController {
        let vc = FriendListWithInvitationViewController()
        vc.navigationItem.title = PageCategories.FriendListWithInvitation.rawValue
        vc.view.backgroundColor = .blue
        return vc
    }
}
