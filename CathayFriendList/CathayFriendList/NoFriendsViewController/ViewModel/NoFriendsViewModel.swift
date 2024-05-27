//
//  NoFriendsViewModel.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation


class NoFriendsViewModel: FriendsPageBaseViewModel {
   
    func numberOfRowInSection(section: Int) -> Int {
        if self.hasFriends {
            switch section {
            case 0:
                // 判斷是否有邀請朋友，決定 cell number
                return 0
            case 1:
                // 判斷是否有邀請朋友，決定 cell number
                return 0
            default:
                return 0
            }
        } else {
            switch section {
            case 0:
                return 0
            case 1:
                return 1
            default:
                return 0
            }
        }
    }
}
