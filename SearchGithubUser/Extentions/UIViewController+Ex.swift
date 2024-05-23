//
//  UIViewController+Ex.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 23.05.24.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .destructive))
        self.present(alert, animated: true)
    }
}
