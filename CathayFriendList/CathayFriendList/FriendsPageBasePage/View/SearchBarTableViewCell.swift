//
//  SearchBarTableViewCell.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/27.
//

import UIKit

class SearchBarTableViewCell: UITableViewCell {
    
    var textFieldDidChangeSelectionClosure: ((String) -> Void)?
    
    @objc
    func didTapSearchBar() {
        self.searchTextField.becomeFirstResponder()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.setupSearchBarBackgroundView()
        self.setupFriendsAddImageView()
        self.setupSearchIconImageView()
        self.setupSearchTextField()
    }
    
    private func setupSearchBarBackgroundView() {
        self.contentView.addSubview(self.searchBarBackgroundView)
        self.searchBarBackgroundView.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading)
                .offset(30)
            $0.trailing.equalTo(self.snp.trailing)
                .offset(-69)
            $0.top.equalTo(self.snp.top)
                .offset(15)
            $0.bottom.equalTo(self.snp.bottom)
                .offset(-10)
        }
    }
    
    private func setupFriendsAddImageView() {
        self.contentView.addSubview(self.friendsAddImageView)
        self.friendsAddImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.searchBarBackgroundView.snp.centerY)
            $0.trailing.equalTo(self.contentView.snp.trailing)
                .offset(-30)
        }
    }
    
    private func setupSearchIconImageView() {
        self.searchBarBackgroundView.addSubview(self.searchIconImageView)
        self.searchIconImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.searchBarBackgroundView.snp.centerY)
            $0.leading.equalTo(self.searchBarBackgroundView.snp.leading)
                .offset(10)
        }
    }
    
    private func setupSearchTextField() {
        self.searchBarBackgroundView.addSubview(self.searchTextField)
        self.searchTextField.snp.makeConstraints {
            $0.centerY.equalTo(self.searchIconImageView.snp.centerY)
            $0.leading.equalTo(self.searchIconImageView.snp.trailing)
                .offset(8)
        }
    }
    
    private lazy var searchBarBackgroundView: UIView = {
        let view = UIView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSearchBar))
        view.backgroundColor = .searchBarColor.withAlphaComponent(0.12)
        view.layer.cornerRadius = 10
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .searchBarIconImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .mainLabelColor
        textField.attributedPlaceholder = NSAttributedString(string: "想轉一筆給誰呢？", attributes: [NSAttributedString.Key.foregroundColor : UIColor.searchBarColor])
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var friendsAddImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .friendsAddImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}

extension SearchBarTableViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.textFieldDidChangeSelectionClosure?(textField.text ?? "")
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
