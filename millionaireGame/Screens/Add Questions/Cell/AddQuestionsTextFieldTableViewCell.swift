//
//  AddQuestionsTextFieldTableViewCell.swift
//  millionaireGame
//
//  Created by Ke4a on 07.06.2022.
//

import UIKit

class AddQuestionsTextFieldTableViewCell: AddQuestionsBaseTableViewCell {
    // MARK: - Visual Components

    private let questionTextField: AddQuestionsTextField = {
        let textField = AddQuestionsTextField(.question)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let answerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            AddQuestionsTextField(.correctAnswer),
            AddQuestionsTextField(.wrongAnswer),
            AddQuestionsTextField(.wrongAnswer),
            AddQuestionsTextField(.wrongAnswer)])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private var question = QuestionModel(level: 0, question: "", answers: ["", "", "", ""], correctAnswer: "")

    // MARK: - Static Properties

    static var identifier: String = "AddQuestionsTableViewCell"

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()

        questionTextField.delegate = self

        answerStackView.arrangedSubviews.forEach { view in
            let textField = view as? UITextField
            textField?.delegate = self
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Prepare For Reuse

    override func prepareForReuse() {
        questionTextField.text = nil

        let stack = answerStackView.arrangedSubviews as? [UITextField]
        stack?.forEach { textField in
            textField.text = nil
        }
    }

    // MARK: - Setting UI Methods

    private func setupUI() {
        contentView.addSubview(questionTextField)
        NSLayoutConstraint.activate([
            questionTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            questionTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            questionTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
        ])

        answerStackView.distribution = .fillEqually
        answerStackView.axis = .vertical
        answerStackView.spacing = 4

        contentView.addSubview(answerStackView)
        NSLayoutConstraint.activate([
            answerStackView.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 8),
            answerStackView.bottomAnchor.constraint(equalTo: trashButton.topAnchor),
            answerStackView.leadingAnchor.constraint(equalTo: questionTextField.leadingAnchor),
            answerStackView.trailingAnchor.constraint(equalTo: questionTextField.trailingAnchor)
        ])
    }

    // MARK: - Public Methods

    func buildQuestion() throws -> QuestionModel? {
        guard !self.question.question.isEmpty,
              !question.correctAnswer.isEmpty,
              !question.answers[0].isEmpty,
              !question.answers[1].isEmpty,
              !question.answers[2].isEmpty,
              !question.answers[3].isEmpty
        else { throw MyError.getQuestionError }

        return question
    }
}

extension AddQuestionsTextFieldTableViewCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }

        if textField == self.questionTextField {
            question.question = text
        } else if textField == answerStackView.arrangedSubviews[0] {
            question.correctAnswer = text
            question.answers[0] = text
        } else if textField == answerStackView.arrangedSubviews[1] {
            question.answers[1] = text
        } else if textField == answerStackView.arrangedSubviews[2] {
            question.answers[2] = text
        } else if textField == answerStackView.arrangedSubviews[3] {
            question.answers[3] = text
        }
    }
}
