//
//  FriendListWithInvitationViewController.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit

class FriendListWithInvitationViewController: FriendsPageBaseViewController {
    
    let viewModel: FriendListWithInvitationViewModel
    
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
         viewModel: FriendListWithInvitationViewModel) {
        self.viewModel = viewModel
        super.init(userDetail: userDetail, baseViewModel: baseViewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindingData() {
        self.viewModel.getFriendsList {
            self.viewModel.initFilteredFriendsList()
            self.reloadTableView()
        }
    }
}

extension FriendListWithInvitationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InvitationTableViewCell.self), for: indexPath) as? InvitationTableViewCell else {
                return UITableViewCell()
            }
            let data = self.viewModel.invitedFriendModel[indexPath.row]
            cell.updateContent(data: data)
            cell.selectionStyle = .none
            return cell
            
        case 1:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchBarTableViewCell.self), for: indexPath) as? SearchBarTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.textFieldDidChangeSelectionClosure = { [weak self] keyword in
                    guard let self else { return }
                    self.viewModel.filteredFriendsList(query: keyword) {
                        tableView.reloadSections(IndexSet(integer: 1), with: .none)
                    }
                }
                cell.selectionStyle = .none
                return cell
                
            } else {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FriendTableViewCell.self), for: indexPath) as? FriendTableViewCell else {
                    return UITableViewCell()
                }
                let data = self.viewModel.filteredFriendsList[indexPath.row - 1]
                cell.updateContent(data: data)
                cell.selectionStyle = .none
                return cell
            }
            
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension FriendListWithInvitationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.viewModel.heightForRowAt(section: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: UserDetailHeaderView.self)) as? UserDetailHeaderView else { return UIView() }
            headerView.updateUserName(text: self.userDetail.name)
            headerView.updateUserId(text: self.userDetail.kokoid)
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
}
