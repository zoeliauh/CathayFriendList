//
//  RequestErrorType.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Alamofire

public enum RequestErrorType: Error {
    case ServerConnectFail
    case WrongResponseData
    case RequestWithAFError(error: AFError)
    case RequestFail(message: String)
}
