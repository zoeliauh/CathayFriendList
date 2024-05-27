//
//  ApiServiceRequest.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import Foundation
import Alamofire


class ApiServiceRequest<RequestResponse: Decodable, RequestParameters: Encodable> {
    var url: String
    
    typealias Completion = ((Result<RequestResponse?, RequestErrorType>) -> Void)?
    
    init(api: ApiPathProtocol) {
        self.url = ApiUrlFactory().createUrl(host: .onlineHost,
                                             path: api)
    }
    
    @discardableResult
    func forumRequest(method: HTTPMethod,
                      headers: HTTPHeaders? = [.contentType(RequestHeaderEnum.applicationJson.rawValue)],
                      parameters: RequestParameters?,
                      completion: Completion) -> DataRequest {
        
        let request = AF.request(self.url,
                                 method: method,
                                 parameters: parameters,
                                 encoder: JSONParameterEncoder.default,
                                 headers: headers)
            .response { response in
                guard let statusCode = response.response?.statusCode else {
                    completion?(.failure(.ServerConnectFail))
                    return
                }
                
                if statusCode == 500 {
                    completion?(.failure(.ServerConnectFail))
                    return
                }
                
                
                if let error = response.error {
                    completion?(.failure(.RequestWithAFError(error: error)))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    guard let data = response.data else {
                        if (200...299).contains(statusCode) {
                            completion?(.success(nil))
                        } else {
                            completion?(.failure(.WrongResponseData))
                        }
                        return
                    }
                    
                    let successModel = try decoder.decode(RequestResponse.self,
                                                          from: data)
                    completion?(.success(successModel))
                } catch {
                    completion?(.failure(.WrongResponseData))
                }
            }
        
        return request
    }
}
