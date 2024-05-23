//
//  MainViewModel.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 22.05.24.
//

import UIKit
import Alamofire

final class MainViewModel {
    func getUserInfo(with username: String, completion: @escaping ((Result<User, AFError>)->Void)) {
        NetworkManager.shared.getUserInformation(with: username) { result in
            completion(result)
        }
    }
}
