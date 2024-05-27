//
//  UserDetailHeaderView.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit
import SnapKit


class UserDetailHeaderView: UITableViewHeaderFooterView {
    
    private var hasUserId: Bool = false
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .headerViewBackgroundColor
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateUserName(text: String) {
        self.userName.updateLabel(text: text)
    }
    
    func updateUserId(text: String) {
        self.userId.updateLabel(text: "KOKO ID：\(text)")
        self.hasUserId = true
        self.updateNoUserIdReminderView()
    }
    
    private func updateNoUserIdReminderView() {
        self.noUserIdReminderView.isHidden = self.hasUserId
    }
    
    //MARK: Setup(View)
    private func setupView() {
        self.setupUserName()
        self.setupUserId()
        self.setupBackArrowImageView()
        self.setupNoUserIdReminderView()
        self.setupAvatarImageView()
    }
    
    private func setupUserName() {
        self.contentView.addSubview(self.userName)
        self.userName.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top)
                .offset(8)
            $0.leading.equalTo(self.contentView.snp.leading)
                .offset(30)
        }
    }
    
    private func setupUserId() {
        self.contentView.addSubview(self.userId)
        self.userId.snp.makeConstraints {
            $0.leading.equalTo(self.userName.snp.leading)
            $0.top.equalTo(self.userName.snp.bottom)
                .offset(8)
            $0.bottom.equalTo(self.contentView.snp.bottom)
                .offset(-2)
        }
    }
    
    private func setupBackArrowImageView() {
        self.contentView.addSubview(self.backArrowImageView)
        self.backArrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.userId.snp.centerY)
            $0.leading.equalTo(self.userId.snp.trailing)
        }
    }
    
    private func setupNoUserIdReminderView() {
        self.contentView.addSubview(self.noUserIdReminderView)
        self.noUserIdReminderView.snp.makeConstraints {
            $0.centerY.equalTo(self.backArrowImageView.snp.centerY)
            $0.leading.equalTo(self.backArrowImageView.snp.trailing)
                .offset(15)
            $0.height.equalTo(10)
            $0.width.equalTo(10)
        }
    }
    
    private func setupAvatarImageView() {
        self.contentView.addSubview(self.avatarImageView)
        self.avatarImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.contentView.snp.centerY)
            $0.trailing.equalTo(self.contentView.snp.trailing)
                .offset(-30)
        }
    }
    
    private lazy var userName: ModelLabel = {
        let label = ModelLabel(text: "userName",
                               color: .mainLabelColor,
                               font: .userNameFont)
        return label
    }()
    
    private lazy var userId: ModelLabel = {
        let label = ModelLabel(text: "設定 KOKO ID",
                               color: .mainLabelColor,
                               font: .userIdFont)
        return label
    }()
    
    private lazy var backArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backDeepGrayImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var noUserIdReminderView: UIView = {
        let view = UIView()
        view.backgroundColor = .selectedItemBottomLineColor
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .avatarFemaleDefaultImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}
