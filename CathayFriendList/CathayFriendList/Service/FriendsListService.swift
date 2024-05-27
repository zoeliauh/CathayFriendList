//
//  NoFriendsAndInvitationService.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation


struct FriendsListService: ApiRequestAble {
    
    var api: ApiPathProtocol?
    
    let apiServiceRequest: ApiServiceRequest<FriendsListResponse, FriendsListParameter>
    
    init(api: ApiPathProtocol) {
        self.apiServiceRequest = ApiServiceRequest(api: api)
    }
    
    struct FriendsListParameter: Encodable { }
    struct FriendsListResponse: Decodable {
        let response: [FriendModel]?
    }
    
    typealias ApiParameter = FriendsListParameter
    typealias ApiResponse = FriendsListResponse
    typealias FriendsListCompletion = ((Result<ApiResponse, RequestErrorType>) -> Void)?
    
    func getFriendsList(completion: FriendsListCompletion) {
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
