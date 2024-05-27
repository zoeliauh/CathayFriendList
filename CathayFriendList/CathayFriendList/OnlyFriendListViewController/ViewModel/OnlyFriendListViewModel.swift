//
//  OnlyFriendListViewModel.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation


class OnlyFriendListViewModel: FriendsPageBaseViewModel {
    
    var margedFriendsList: [FriendModel] = []
    var filteredFriendsList: [FriendModel] = []
    
    private let group = DispatchGroup()
    
    func numberOfRowInSection(section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return self.filteredFriendsList.count + 1
        default:
            return 0
        }
    }
    
    func mergeFriendsModel(completion: (() -> Void)?) {
        var mergedDict = [String: FriendModel]()
        
        self.group.enter()
        self.getFriendsList { [weak self] in
            self?.group.leave()
        }
        
        self.group.enter()
        self.getOtherFriendsList { [weak self] in
            self?.group.leave()
        }
        
        self.group.notify(queue: .main) {
            let allModels = self.friendsModel + self.friendsModelTwo
            
            for model in allModels {
                if let existingModel = mergedDict[model.fid],
                   let existingDate = self.parseDate(existingModel.updateDate),
                   let currentDate = self.parseDate(model.updateDate) {
                    if currentDate > existingDate {
                        mergedDict[model.fid] = model
                    }
                } else {
                    mergedDict[model.fid] = model
                }
            }
            self.margedFriendsList = Array(mergedDict.values)
            self.filteredFriendsList = self.margedFriendsList
            completion?()
        }
    }
    
    func filteredFriendsList(query keyword: String, completion: (() -> Void)?) {
        if keyword.isEmpty {
            self.filteredFriendsList = self.margedFriendsList
        } else {
            self.filteredFriendsList = self.margedFriendsList.filter { model in
                return model.name.contains(keyword)
            }
        }
        completion?()
    }
    
    private func parseDate(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        if let date = dateFormatter.date(from: dateString) {
            return date
        }
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.date(from: dateString)
    }
}
