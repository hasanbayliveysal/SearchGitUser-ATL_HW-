//
//  NetworkManager.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 22.05.24.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func getUserInformation(with username: String, completion: @escaping ((Result<User, AFError>)->Void))
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared: NetworkManagerProtocol = NetworkManager()
    
    func getUserInformation(with username: String, completion: @escaping ((Result<User, AFError>)->Void)) {
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            return
        }
        AF.request(url).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                completion(.success(user))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
