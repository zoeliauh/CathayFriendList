//
//  UserInfoService.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation


struct UserInfoService: ApiRequestAble {
    
    let apiServiceRequest: ApiServiceRequest<UserInfoResponse, UserInfoParameter>
    
    init() {
        self.apiServiceRequest = ApiServiceRequest(api: FriendsTabApiPath.UserInfoApi)
    }
    
    struct UserInfoParameter: Encodable { }
    struct UserInfoResponse: Decodable {
        let response: [UserDetailModel]
    }
    
    typealias ApiParameter = UserInfoParameter
    typealias ApiResponse = UserInfoResponse
    typealias UserInfoCompletion = ((Result<ApiResponse, RequestErrorType>) -> Void)?
    
    func getUserInfo(completion: UserInfoCompletion) {
        self.apiServiceRequest.forumRequest(method: .get, 
                                            parameters: nil) { result in
            switch result {
            case .success(let res):
                guard let res else {
                    (completion?(.failure(.WrongResponseData)))
                    return
                }
                completion?(.success(res))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
