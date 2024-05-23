//
//  UIStackView+Ex.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 23.05.24.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubview() {
        arrangedSubviews.forEach({
            removeArrangedSubview($0)
            $0.snp.removeConstraints()
            $0.removeFromSuperview()
        })
    }
}
