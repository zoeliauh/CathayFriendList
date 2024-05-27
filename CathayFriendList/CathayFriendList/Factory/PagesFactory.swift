//
//  PagesFactory.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit


class PagesFactory {
    
    func createNoFriendsViewController(userDetail: UserDetailModel) -> NoFriendsViewController {
        let api = FriendsTabApiPath.NoFriendsAndInvitationApi
        let service = FriendsListService(api: api)
        let vm = NoFriendsViewModel(service: service)
        let vc = NoFriendsViewController(userDetail: userDetail,
                                         baseViewModel: vm,
                                         viewModel: vm)
        vc.navigationItem.title = PageCategories.NoFriends.rawValue
        vc.view.backgroundColor = .appBackgroundColor
        return vc
    }
    
    func createOnlyFriendListViewController(userDetail: UserDetailModel) -> OnlyFriendListViewController {
        let api = FriendsTabApiPath.FriendsListOneApi
        let apiTwo = FriendsTabApiPath.FirendsListTwoApi
        let service = FriendsListService(api: api)
        let serviceTwo = FriendsListService(api: apiTwo)
        let vm = OnlyFriendListViewModel(service: service, serviceTwo: serviceTwo)
        let vc = OnlyFriendListViewController(userDetail: userDetail,
                                              baseViewModel: vm,
                                              viewModel: vm)
        vc.navigationItem.title = PageCategories.OnlyFriendList.rawValue
        vc.view.backgroundColor = .appBackgroundColor
        return vc
    }
    
    func createFriendListWithInvitationViewController(userDetail: UserDetailModel) -> FriendListWithInvitationViewController {
        let api = FriendsTabApiPath.FriendsListWithInvitationApi
        let service = FriendsListService(api: api)
        let vm = FriendListWithInvitationViewModel(service: service)
        let vc = FriendListWithInvitationViewController(userDetail: userDetail,
                                                        baseViewModel: vm,
                                                        viewModel: vm)
        vc.navigationItem.title = PageCategories.FriendListWithInvitation.rawValue
        vc.view.backgroundColor = .appBackgroundColor
        return vc
    }
}
