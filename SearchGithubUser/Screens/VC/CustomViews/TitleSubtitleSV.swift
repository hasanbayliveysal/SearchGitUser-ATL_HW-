//
//  TitleSubtitleSV.swift
//  SearchGithubUser
//
//  Created by Veysal Hasanbayli on 22.05.24.
//

import UIKit
import SnapKit

class TitleSubtitleSV: UIStackView {
    let title: String
    let subtitle: String?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = subtitle
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    init(title: String, subtitle: String?, frame: CGRect = .zero) {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        subtitleLabel.isHidden = (subtitle == nil)
        alignment = .center
        axis = .vertical
        spacing = 4
        distribution = .equalSpacing
        [titleLabel, subtitleLabel].forEach({addArrangedSubview($0)})
    }
}
