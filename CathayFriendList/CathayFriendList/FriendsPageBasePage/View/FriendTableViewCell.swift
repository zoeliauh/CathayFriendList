//
//  FriendTableViewCell.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/27.
//

import UIKit


class FriendTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.initCell()
    }
    
    func updateContent(data: FriendModel) {
        let isSendingInvitation: Bool = data.status == 2
        let isStarFriend: Bool = data.isTop == "1"
        self.nameLabel.text = data.name
        self.starImageView.isHidden = !isStarFriend
        self.invitingButton.isHidden = !isSendingInvitation
        self.moreImageView.isHidden = isSendingInvitation
        
        if isSendingInvitation {
            self.transferButton.snp.makeConstraints {
                $0.trailing.equalTo(self.invitingButton.snp.leading)
                    .offset(-10)
                $0.centerY.equalTo(self.contentView.snp.centerY)
            }
            
        } else {
            self.transferButton.snp.makeConstraints {
                $0.trailing.equalTo(self.moreImageView.snp.leading)
                    .offset(-25)
                $0.centerY.equalTo(self.contentView.snp.centerY)
            }
        }
    }
    
    func initCell() {
        self.starImageView.isHidden = true
        self.invitingButton.isHidden = true
        self.moreImageView.isHidden = false
        self.transferButton.snp.removeConstraints()
    }
    
    private func setupView() {
        self.setupStarImageView()
        self.setupAvatarImageView()
        self.setupNameLabel()
        self.setupSeparateView()
        self.setupMoreImageView()
        self.setupTransferButton()
        self.setupInvitingButton()
    }
    
    private func setupStarImageView() {
        self.contentView.addSubview(self.starImageView)
        self.starImageView.snp.makeConstraints {
            $0.leading.equalTo(self.contentView.snp.leading)
                .offset(30)
            $0.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    private func setupAvatarImageView() {
        self.contentView.addSubview(self.avatarImageView)
        self.avatarImageView.snp.makeConstraints {
            $0.leading.equalTo(self.contentView.snp.leading)
                .offset(50)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    private func setupNameLabel() {
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.avatarImageView.snp.trailing)
                .offset(15)
            $0.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    private func setupSeparateView() {
        self.contentView.addSubview(self.separateView)
        self.separateView.snp.makeConstraints {
            $0.leading.equalTo(self.nameLabel.snp.leading)
            $0.trailing.equalTo(self.contentView.snp.trailing)
                .offset(-30)
            $0.bottom.equalTo(self.contentView.snp.bottom)
            $0.height.equalTo(1)
        }
    }
    
    private func setupMoreImageView() {
        self.contentView.addSubview(self.moreImageView)
        self.moreImageView.snp.makeConstraints {
            $0.trailing.equalTo(self.contentView.snp.trailing)
                .offset(-30)
            $0.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    private func setupTransferButton() {
        self.contentView.addSubview(self.transferButton)
    }
    
    private func setupInvitingButton() {
        self.contentView.addSubview(self.invitingButton)
        self.invitingButton.snp.makeConstraints {
            $0.trailing.equalTo(self.contentView.snp.trailing)
                .offset(-20)
            $0.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.image = .friendsStarImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    private lazy var transferButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.cornerStyle = .medium
        let button = UIButton()
        button.setTitle("轉帳", for: .normal)
        button.setTitleColor(.selectedItemBottomLineColor,
                             for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1.2
        button.layer.borderColor = UIColor.selectedItemBottomLineColor.cgColor
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var invitingButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.cornerStyle = .medium
        let button = UIButton()
        button.setTitle("邀請中", for: .normal)
        button.setTitleColor(.subLabelColor,
                             for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1.2
        button.layer.borderColor = UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1).cgColor
        button.configuration = config
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .friendsMoreImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .friendCellSeparateLineColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
