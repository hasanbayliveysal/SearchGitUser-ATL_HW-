//
//  MainViewModel.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 22.05.24.
//

import UIKit

class MainViewModel {
    func getUserInfo(with username: String, completion: @escaping ((User)->Void)) {
        NetworkManager.shared.getUserInformation(with: username) { result in
            switch result {
            case .failure(let err):
                print("Error", err)
            case .success(let user):
                completion(user)
            }
        }
    }
}
