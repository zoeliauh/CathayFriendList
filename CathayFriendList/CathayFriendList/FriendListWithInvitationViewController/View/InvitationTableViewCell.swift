//
//  InvitationTableViewCell.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/27.
//

import UIKit
import SnapKit


class InvitationTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .headerViewBackgroundColor
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContent(data: FriendModel) {
        self.nameLabel.text = data.name
    }
    
    private func setupView() {
        self.setupBackgroundWhiteView()
        self.setupAvatarImageView()
        self.setupNameLabel()
        self.setupInvitedLabel()
        self.setupFriendsDeleteImageView()
        self.setupFriendsAgreeImageView()
    }
    
    private func setupBackgroundWhiteView() {
        self.contentView.addSubview(self.backgroundWhiteView)
        self.backgroundWhiteView.snp.makeConstraints {
            $0.leading.equalTo(self.contentView.snp.leading)
                .offset(30)
            $0.trailing.equalTo(self.contentView.snp.trailing)
                .offset(-30)
            $0.centerY.equalTo(self.contentView.snp.centerY)
            $0.height.equalTo(70)
        }
    }
    
    private func setupAvatarImageView() {
        self.backgroundWhiteView.addSubview(self.avatarImageView)
        self.avatarImageView.snp.makeConstraints {
            $0.leading.equalTo(self.backgroundWhiteView.snp.leading)
                .offset(15)
            $0.centerY.equalTo(self.backgroundWhiteView.snp.centerY)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
    }
    
    private func setupNameLabel() {
        self.backgroundWhiteView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.avatarImageView.snp.trailing)
                .offset(15)
            $0.top.equalTo(self.avatarImageView.snp.top)
        }
    }
    
    private func setupInvitedLabel() {
        self.backgroundWhiteView.addSubview(self.invitedLabel)
        self.invitedLabel.snp.makeConstraints {
            $0.leading.equalTo(self.nameLabel.snp.leading)
            $0.bottom.equalTo(self.avatarImageView.snp.bottom)
        }
    }
    
    private func setupFriendsDeleteImageView() {
        self.backgroundWhiteView.addSubview(self.friendsDeleteImageView)
        self.friendsDeleteImageView.snp.makeConstraints {
            $0.trailing.equalTo(self.backgroundWhiteView.snp.trailing)
                .offset(-15)
            $0.centerY.equalTo(self.backgroundWhiteView.snp.centerY)
        }
    }
    
    private func setupFriendsAgreeImageView() {
        self.backgroundWhiteView.addSubview(self.friendsAgreeImageView)
        self.friendsAgreeImageView.snp.makeConstraints {
            $0.trailing.equalTo(self.friendsDeleteImageView.snp.leading)
                .offset(-15)
            $0.centerY.equalTo(self.backgroundWhiteView.snp.centerY)
        }
    }
    
    private lazy var backgroundWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .appBackgroundColor
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
    
    private lazy var nameLabel: ModelLabel = {
        let label = ModelLabel(text: "朋友Ａ",
                               color: .mainLabelColor,
                               font: .friendNameFont)
        return label
    }()
    
    private lazy var invitedLabel: ModelLabel = {
        let label = ModelLabel(text: "邀請你成為好友：）",
                               color: .subLabelColor,
                               font: .systemFont(ofSize: 13,
                                                 weight: .regular))
        return label
    }()
    
    private lazy var friendsAgreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .friendsAgreeImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var friendsDeleteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .friendsDeleteImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}
