//
//  UILabel.swift
//  CathayFriendList
//
//  Created by woanjwu liauh on 2024/5/26.
//

import UIKit

class ModelLabel: UILabel {
    
    //MARK: Life cycle
    init(text: String,
         color: UIColor,
         font: UIFont) {
        super.init(frame: .zero)
        self.setupView(text: text, color: color, font: font)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup(View)
    private func setupView(text: String,
                           color: UIColor,
                           font: UIFont) {
        self.text = text
        self.textColor = color
        self.font = font
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateLabel(text: String) {
        self.text = text
    }
}

