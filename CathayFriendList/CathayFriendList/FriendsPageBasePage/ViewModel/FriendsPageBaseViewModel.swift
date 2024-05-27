//
//  FriendsPageBaseViewModel.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation


class FriendsPageBaseViewModel {
    
    let service: FriendsListService
    
    // only for 好友畫面列表
    var serviceTwo: FriendsListService? = nil
    
    // status == 1 (已完成) or 2 (邀請中)
    var friendsModel: [FriendModel] = []
    var friendsModelTwo: [FriendModel] = []
    
    // status == 0 (送出邀請)
    var invitedFriendModel: [FriendModel] = []
    
    var hasFriends: Bool = false {
        didSet {
            hasFriends = !self.friendsModel.isEmpty
        }
    }
    
    var hasInvitations: Bool = false {
        didSet {
            hasInvitations = !self.invitedFriendModel.isEmpty
        }
    }
    
    init(service: FriendsListService,
         serviceTwo: FriendsListService? = nil) {
        self.service = service
        self.serviceTwo = serviceTwo
    }
    
    func getFriendsList(completion: (() -> Void)?) {
        self.service.getFriendsList { [weak self] result in
            switch result {
            case .success(let res):
                guard let self else { return }
                res.response?.forEach {
                    if $0.status == 1 || $0.status == 2 {
                        self.friendsModel.append($0)
                    } else if $0.status == 0 {
                        self.invitedFriendModel.append($0)
                    }
                }
                
                completion?()
            case .failure(let error):
                print("getFriendsList error \(error)")
            }
        }
    }
    
    func getOtherFriendsList(completion: (() -> Void)?) {
        guard let serviceTwo else { return }
        serviceTwo.getFriendsList { [weak self] result in
            switch result {
            case .success(let res):
                guard let self else { return }
                self.friendsModelTwo = res.response ?? []
                completion?()
            case .failure(let error):
                print("getFriendsList2 error \(error)")
            }
        }
    }
    
    func heightForRowAt(section: Int) -> CGFloat {
        switch section {
        case 0:
            return 80
        case 1:
            return 60
        default:
            return 0
        }
    }
}
