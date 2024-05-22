//
//  MainViewController.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 22.05.24.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    private let vm: MainViewModel = MainViewModel()
    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.addTargetSearchButton(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        return view
    }()
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 24
        return stackView
    }()
    private let userInfoSV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let centerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.backgroundColor = .cyan
        return imageView
    }()
}
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    private func setup() {
        view.addSubview(mainStackView)
        view.addSubview(headerView)
        [centerImageView,
         TitleSubtitleSV(title: "Username", subtitle: "Bio"),
         userInfoSV]
            .forEach({mainStackView.addArrangedSubview($0)})
        
        [TitleSubtitleSV(title: "180", subtitle: "Followers"),
         TitleSubtitleSV(title: "20", subtitle: "Following"),
         TitleSubtitleSV(title: "20", subtitle: "Github Repos")]
            .forEach({userInfoSV.addArrangedSubview($0)})
        setupConstraints()
    }
    
    private func setupConstraints(){
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        centerImageView.snp.makeConstraints { make in
            make.width.height.equalTo(140)
        }
    }
   
    @objc
    private func didTapSearchButton() {
        guard let searchedText = headerView.getTextFieldText(),
                  !searchedText.isEmpty else {
            return
        }
        vm.getUserInfo(with: searchedText) { [weak self] user in
            self?.centerImageView.kf.setImage(with: URL(string: user.image))
        }
    }
}

