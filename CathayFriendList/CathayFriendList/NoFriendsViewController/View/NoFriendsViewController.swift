//
//  NoFriendsViewController.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit

class NoFriendsViewController: FriendsPageBaseViewController {
    
    let viewModel: NoFriendsViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableViewDelegateAndDataSource(dataSource: self, delegate: self)
        self.bindingData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    init(userDetail: UserDetailModel,
         baseViewModel: FriendsPageBaseViewModel,
         viewModel: NoFriendsViewModel) {
        self.viewModel = viewModel
        super.init(userDetail: userDetail, baseViewModel: baseViewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindingData() {
        self.viewModel.getFriendsList { [weak self] in
            self?.reloadTableView()
        }
    }
}

extension NoFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRowInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NoFriendsTableViewCell.self), for: indexPath) as? NoFriendsTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension NoFriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: UserDetailHeaderView.self)) as? UserDetailHeaderView else { return UIView() }
            headerView.updateUserName(text: self.userDetail.name)
            return headerView
            
        case 1:
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: FriendsPageSelectBarHeaderView.self)) as? FriendsPageSelectBarHeaderView else { return UIView() }
            return headerView
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
