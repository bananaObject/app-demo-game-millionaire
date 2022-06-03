//
//  ResultTableViewCell.swift
//  millionaireGame
//
//  Created by Ke4a on 31.05.2022.
//

import UIKit

final class ResultTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = MyFont.text
        label.backgroundColor = MyColor.main
        label.textColor = .white
        return label
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = MyColor.main
        label.font = MyFont.text
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = MyColor.main
        return stackView
    }()

    // MARK: - Static Properties

    static var identifier: String = "ResultTableViewCell"

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(name: String, result: String) {
        nameLabel.text = name
        resultLabel.text = result
    }

    // MARK: - Private Methods

    private func setupUI() {
        isUserInteractionEnabled = false
        contentView.backgroundColor = MyColor.main

        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(resultLabel)

        stackView.distribution = .fillEqually
        stackView.spacing = 10
    }
}
