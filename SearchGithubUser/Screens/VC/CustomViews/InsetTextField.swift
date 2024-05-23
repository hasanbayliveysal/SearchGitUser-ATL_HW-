//
//  InsetTextField.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 23.05.24.
//

import UIKit


class InsetTextField: UITextField {
    let inset: CGFloat = 10

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , inset , inset)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , inset , inset)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, inset)
    }
}
