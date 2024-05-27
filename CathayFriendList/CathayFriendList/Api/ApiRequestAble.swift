//
//  ApiRequestAble.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation

protocol ApiRequestAble {
    associatedtype ApiParameter: Encodable
    associatedtype ApiResponse: Decodable
    
    var apiServiceRequest: ApiServiceRequest<ApiResponse, ApiParameter> { get }
}

extension ApiRequestAble {
    public typealias Completion = ((Result<ApiResponse, RequestErrorType>) -> Void)?
}
