//
//  AddQuestionsBaseTableViewCell.swift
//  millionaireGame
//
//  Created by Ke4a on 13.06.2022.
//

import UIKit

protocol AddQuestionsBaseTableViewCellDelegate: AnyObject {
    func removeTextField(_ cell: UITableViewCell)
}

class AddQuestionsBaseTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    lazy var trashButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = MyColor.main
        button.backgroundColor = MyColor.red
        button.layer.cornerRadius = 5.0
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(trashButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Protocol Delegate

    weak var delegate: AddQuestionsBaseTableViewCellDelegate?

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setting UI Methods

    private func setupUI() {
        selectionStyle = .none

        backgroundColor = MyColor.main

        contentView.addSubview(trashButton)
        NSLayoutConstraint.activate([
            trashButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            trashButton.heightAnchor.constraint(equalToConstant: 30),
            trashButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            trashButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
        ])

    }

    // MARK: - Actions

    @objc func trashButtonAction() {
        delegate?.removeTextField(self)
    }
}
