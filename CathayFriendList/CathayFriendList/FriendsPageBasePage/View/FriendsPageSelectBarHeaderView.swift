//
//  FriendsPageSelectBarHeaderView.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit


class FriendsPageSelectBarHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .headerViewBackgroundColor
        self.setupBarItemsStackView()
        self.setupSeparateView()
        self.setupSelectedItemBottomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBarItemsStackView() {
        self.contentView.addSubview(self.barItemsStackView)
        self.barItemsStackView.snp.makeConstraints {
            $0.leading.equalTo(self.contentView.snp.leading)
                .offset(30)
            $0.centerY.equalTo(self.contentView.snp.centerY)
        }
    }
    
    private func setupSeparateView() {
        self.contentView.addSubview(self.separateView)
        self.separateView.snp.makeConstraints {
            $0.leading.equalTo(self.contentView.snp.leading)
            $0.trailing.equalTo(self.contentView.snp.trailing)
            $0.bottom.equalTo(self.contentView.snp.bottom)
            $0.height.equalTo(1)
        }
    }
    
    private func setupSelectedItemBottomView() {
        self.contentView.addSubview(self.selectedItemBottomView)
        self.selectedItemBottomView.snp.makeConstraints {
            $0.leading.equalTo(self.friendsItem.snp.leading)
                .offset(3)
            $0.trailing.equalTo(self.friendsItem.snp.trailing)
                .offset(-3)
            $0.bottom.equalTo(self.contentView.snp.bottom)
            $0.height.equalTo(4)
        }
    }
    
    private lazy var barItemsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.friendsItem,
            self.chatItem
        ])
        stackView.axis = .horizontal
        stackView.spacing = 36
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var friendsItem: ModelLabel = {
       let label = ModelLabel(text: "好友",
                              color: .mainLabelColor,
                              font: .selectedItemFont)
        return label
    }()
    
    private lazy var chatItem: ModelLabel = {
       let label = ModelLabel(text: "聊天",
                              color: .mainLabelColor,
                              font: .notSelectedItemFont)
        return label
    }()
    
    private lazy var separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .separateLineColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var selectedItemBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .selectedItemBottomLineColor
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
