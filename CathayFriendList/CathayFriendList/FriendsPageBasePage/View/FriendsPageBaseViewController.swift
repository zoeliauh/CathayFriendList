//
//  FriendsPageBaseViewController.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit
import SnapKit

class FriendsPageBaseViewController: UIViewController {
    
    let userDetail: UserDetailModel
    
    let baseViewModel: FriendsPageBaseViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUserDetailWithFriendsTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    init(userDetail: UserDetailModel,
         baseViewModel: FriendsPageBaseViewModel) {
        self.userDetail = userDetail
        self.baseViewModel = baseViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewDelegateAndDataSource(dataSource: UIViewController, delegate: UIViewController) {
        self.userDetailWithFriendsTableView.dataSource = dataSource as? any UITableViewDataSource
        self.userDetailWithFriendsTableView.delegate = delegate as? any UITableViewDelegate
    }
    
    func reloadTableView(completion: (() -> Void)? = nil) {
        self.userDetailWithFriendsTableView.reloadData()
        completion?()
    }
    
    private func setupUserDetailWithFriendsTableView() {
        self.view.addSubview(self.userDetailWithFriendsTableView)
        self.userDetailWithFriendsTableView.snp.makeConstraints {
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private lazy var userDetailWithFriendsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }        
        tableView.register(UserDetailHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: UserDetailHeaderView.self))
        tableView.register(FriendsPageSelectBarHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: FriendsPageSelectBarHeaderView.self))
        tableView.register(NoFriendsTableViewCell.self, forCellReuseIdentifier: String(describing: NoFriendsTableViewCell.self))
        tableView.register(InvitationTableViewCell.self, forCellReuseIdentifier: String(describing: InvitationTableViewCell.self))
        tableView.register(SearchBarTableViewCell.self, forCellReuseIdentifier: String(describing: SearchBarTableViewCell.self))
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: String(describing: FriendTableViewCell.self))
        tableView.keyboardDismissMode = .onDrag
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
}
