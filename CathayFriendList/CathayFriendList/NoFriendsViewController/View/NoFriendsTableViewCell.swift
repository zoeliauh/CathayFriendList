//
//  NoFriendsTableViewCell.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit
import SnapKit

class NoFriendsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.setupFriendsEmptyImageView()
        self.setupBeingFriendsLabel()
        self.setupBeingFriendsSubLabel()
        self.setupAddFriendButton()
    }
    
    private func setupFriendsEmptyImageView() {
        self.contentView.addSubview(self.friendsEmptyImageView)
        self.friendsEmptyImageView.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top)
                .offset(30)
            $0.centerX.equalTo(self.contentView.snp.centerX)
        }
    }
    
    private func setupBeingFriendsLabel() {
        self.contentView.addSubview(self.beingFriendsLabel)
        self.beingFriendsLabel.snp.makeConstraints {
            $0.top.equalTo(self.friendsEmptyImageView.snp.bottom)
                .offset(41)
            $0.centerX.equalTo(self.contentView.snp.centerX)
        }
    }
    
    private func setupBeingFriendsSubLabel() {
        self.contentView.addSubview(self.beingFriendsSubLabel)
        self.beingFriendsSubLabel.snp.makeConstraints {
            $0.top.equalTo(self.beingFriendsLabel.snp.bottom)
                .offset(8)
            $0.centerX.equalTo(self.contentView.snp.centerX)
        }
    }
    
    private func setupAddFriendButton() {
        self.contentView.addSubview(self.addFriendButton)
        self.addFriendButton.snp.makeConstraints {
            $0.top.equalTo(self.beingFriendsSubLabel.snp.bottom)
                .offset(25)
            $0.leading.equalTo(self.contentView.snp.leading)
                .offset(92)
            $0.trailing.equalTo(self.contentView.snp.trailing)
                .offset(-91)
            $0.centerX.equalTo(self.contentView.snp.centerX)
        }
    }
    
    private lazy var friendsEmptyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .friendsEmptyImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var beingFriendsLabel: ModelLabel = {
        let label = ModelLabel(text: "就從加好友開始吧：）",
                               color: .mainLabelColor,
                               font: .systemFont(ofSize: 21, weight: .medium))
        return label
    }()
    
    private lazy var beingFriendsSubLabel: ModelLabel = {
        let label = ModelLabel(text: "與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）",
                               color: .subLabelColor,
                               font: .systemFont(ofSize: 14, weight: .regular))
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var addFriendButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("加好友",
                        for: .normal)
        button.backgroundColor = .addFriendButtonColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
