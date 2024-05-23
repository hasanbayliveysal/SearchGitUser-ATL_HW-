//
//  HeaderView.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 22.05.24.
//

import UIKit

class HeaderView: UIView {
    private let stackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 16
        return sv
    }()
    private let searchTF: InsetTextField = {
        let tf = InsetTextField()
        tf.placeholder = "Write username"
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.label.cgColor
        tf.layer.borderWidth = 1
        tf.autocorrectionType = .no
        return tf
    }()
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .blue
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        addSubview(stackView)
        [searchTF,searchButton].forEach({stackView.addArrangedSubview($0)})
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        searchButton.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
    
    func getTextFieldText() -> String? {
        return searchTF.text
    }
    
    func addTargetSearchButton(_ target: Any?, action: Selector, for event: UIControl.Event) {
        searchButton.addTarget(target, action: action, for: event)
    }
    
    func clearTextField() {
        self.searchTF.text = ""
    }
}
