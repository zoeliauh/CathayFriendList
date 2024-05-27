//
//  HomeViewModel.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation

class HomeViewModel {
    
    let userInfoService: UserInfoService
    
    //MARK: Init
    var userDetail = UserDetailModel(name: "", kokoid: "")
    
    init(userInfoService: UserInfoService) {
        self.userInfoService = userInfoService
    }
    
    func getUserInfo() {
        self.userInfoService.getUserInfo { [weak self] result in
            switch result {
            case .success(let res):
                guard let self else { return }
                self.userDetail = res.response[0]
            case .failure(let error):
                //TODO: ErrorHandler
                print("getUserInfo failure \(error)")
            }
        }
    }
}
