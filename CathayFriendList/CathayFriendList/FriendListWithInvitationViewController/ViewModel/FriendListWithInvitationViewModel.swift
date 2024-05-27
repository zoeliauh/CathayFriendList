//
//  FriendListWithInvitationViewModel.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation


class FriendListWithInvitationViewModel: FriendsPageBaseViewModel {
    
    var filteredFriendsList: [FriendModel] = []
    
    func initFilteredFriendsList() {
        self.filteredFriendsList = self.friendsModel
    }
    
    func numberOfRowInSection(section: Int) -> Int {
        switch section {
        case 0:
            return self.invitedFriendModel.count
        case 1:
            return self.filteredFriendsList.count + 1
        default:
            return 0
        }
    }
    
    func filteredFriendsList(query keyword: String, completion: (() -> Void)?) {
        if keyword.isEmpty {
            self.filteredFriendsList = self.friendsModel
        } else {
            self.filteredFriendsList = self.friendsModel.filter { model in
                return model.name.contains(keyword)
            }
        }
        completion?()
    }
}
