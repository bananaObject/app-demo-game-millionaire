//
//  AddQuestionsLabelTableViewCell.swift
//  millionaireGame
//
//  Created by Ke4a on 13.06.2022.
//

import UIKit

class AddQuestionsLabelTableViewCell: AddQuestionsBaseTableViewCell {
    // MARK: - Visual Components

    private let questionLabel: AddQuestionsLabel = {
        let label = AddQuestionsLabel()
        label.setColor(.question)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let answerStackView: UIStackView = {
        let label = UIStackView(arrangedSubviews: [
            AddQuestionsLabel(),
            AddQuestionsLabel(),
            AddQuestionsLabel(),
            AddQuestionsLabel()])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Static Properties

    static var identifier: String = "AddQuestionsLabelTableViewCell"

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
        trashButton.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        contentView.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
        ])

        answerStackView.distribution = .fillEqually
        answerStackView.axis = .vertical
        answerStackView.spacing = 4

        contentView.addSubview(answerStackView)
        NSLayoutConstraint.activate([
            answerStackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 8),
            answerStackView.bottomAnchor.constraint(equalTo: trashButton.topAnchor, constant: -2),
            answerStackView.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            answerStackView.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor)
        ])
    }

    // MARK: - Public Methods

    func configure(_ question: QuestionModel) {
        questionLabel.setText(question.question)
        let stack = answerStackView.arrangedSubviews as? [AddQuestionsLabel]

        for (index, answer) in question.answers.enumerated() {
            let label = stack?[index]
            label?.setText(answer)

            if answer == question.correctAnswer {
                label?.setColor(.correctAnswer)
            } else {
                label?.setColor(.wrongAnswer)
            }
        }
    }
}
