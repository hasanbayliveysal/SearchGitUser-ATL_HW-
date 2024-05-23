//
//  MainViewController.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 22.05.24.
//

import UIKit
import Kingfisher

final class MainViewController: UIViewController {
    private let vm: MainViewModel = MainViewModel()
    private var lastSearchedText: String? = nil
    private let activityIndicator: UIActivityIndicatorView = {
        let av = UIActivityIndicatorView()
        av.hidesWhenStopped = true
        return av
    }()
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
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(mainStackView)
        view.addSubview(activityIndicator)
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setup(with user: User) {
        [centerImageView,
         TitleSubtitleSV(title: user.name, subtitle: user.bio),
         userInfoSV]
            .forEach({mainStackView.addArrangedSubview($0)})
        
        [TitleSubtitleSV(title: "\(user.followers)", subtitle: "Followers"),
         TitleSubtitleSV(title:  "\(user.following)", subtitle: "Following"),
         TitleSubtitleSV(title:  "\(user.reposCount)", subtitle: "Github Repos")]
            .forEach({userInfoSV.addArrangedSubview($0)})
        centerImageView.kf.setImage(with: URL(string: user.image))
        setupConstraints()
    }
    
    private func setupConstraints(){
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
            clearBaseView()
            self.showAlert(title: "Error", message: "Username can not be empty")
            return
        }
        guard lastSearchedText != searchedText else {
            return
        }
        self.lastSearchedText = searchedText
        clearBaseView()
        activityIndicator.startAnimating()
        getUserInfo(with: searchedText)
    }
    
    func getUserInfo(with searchedText: String) {
        DispatchQueue.main.async {
            self.vm.getUserInfo(with: searchedText) { [weak self] result in
                switch result {
                case .success(let user):
                    self?.setup(with: user)
                case .failure(_):
                    self?.showAlert(title: "Something went wrong", message: "No user named \(searchedText) was found")
                    self?.headerView.clearTextField()
                }
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func clearBaseView() {
        mainStackView.removeAllArrangedSubview()
        userInfoSV.removeAllArrangedSubview()
    }
}

