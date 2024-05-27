//
//  ApiUrlFactory.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation

struct ApiUrlFactory {
    func createUrl(host: ApiHostEnum,
                   path: ApiPathProtocol) -> String {
        return host.rawValue + path.path
    }
}
