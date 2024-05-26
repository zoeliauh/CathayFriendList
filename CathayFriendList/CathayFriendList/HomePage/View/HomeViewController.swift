//
//  HomeViewController.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    let factory: PagesFactory
    
    private let style = HomeViewStyle()

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupView()
    }
    
    init(factory: PagesFactory) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Event
    @objc
    private func didTapNoFriendsButton() {
        let vc = self.factory.createNoFriendsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func didTapOnlyFriendListButton() {
        let vc = self.factory.createOnlyFriendListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func didTapFriendListWithInvitationButton() {
        let vc = self.factory.createFriendListWithInvitationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Setup (View)
    private func setupView() {
        self.setupButtonsStackView()
    }
    
    private func setupButtonsStackView() {
        self.view.addSubview(self.buttonsStackView)
        self.buttonsStackView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading)
                .offset(self.style.horizontalMarginForStackView)
            make.trailing.equalTo(self.view.snp.trailing)
                .offset(-self.style.horizontalMarginForStackView)
            make.top.equalTo(self.view.snp.top)
                .offset(self.style.verticalMarginForStackView)
            make.bottom.equalTo(self.view.snp.bottom)
                .offset(-self.style.verticalMarginForStackView)
        }
    }
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.noFriendsButton,
            self.onlyFriendListButton,
            self.friendListWithInvitationButton
        ])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = self.style.spacingForStackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var noFriendsButton: UIButton = {
        let button = UIButton()
        button.setTitle(PageCategories.NoFriends.rawValue,
                        for: .normal)
        button.layer.cornerRadius = self.style.cornerRadiusForButton
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector (self.didTapNoFriendsButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var onlyFriendListButton: UIButton = {
        let button = UIButton()
        button.setTitle(PageCategories.OnlyFriendList.rawValue,
                        for: .normal)
        button.layer.cornerRadius = self.style.cornerRadiusForButton
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector (self.didTapOnlyFriendListButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var friendListWithInvitationButton: UIButton = {
        let button = UIButton()
        button.setTitle(PageCategories.FriendListWithInvitation.rawValue,
                        for: .normal)
        button.layer.cornerRadius = self.style.cornerRadiusForButton
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector (self.didTapFriendListWithInvitationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

