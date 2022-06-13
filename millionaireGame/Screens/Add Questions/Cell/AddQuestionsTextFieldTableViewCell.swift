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

    // MARK: - Static Properties

    static var identifier: String = "AddQuestionsTableViewCell"

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
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
        guard let question = questionTextField.text, !question.isEmpty,
              let stack = answerStackView.arrangedSubviews as? [UITextField],
              let correctAnswer = stack[0].text, !correctAnswer.isEmpty,
              let wrongAnswer1 = stack[1].text, !wrongAnswer1.isEmpty,
              let wrongAnswer2 = stack[2].text, !wrongAnswer2.isEmpty,
              let wrongAnswer3 = stack[3].text, !wrongAnswer3.isEmpty
        else { throw MyError.getQuestionError }

        return QuestionModel(level: 0, question: question, answers: [
            correctAnswer,
            wrongAnswer1,
            wrongAnswer2,
            wrongAnswer3
        ], correctAnswer: correctAnswer)
    }
}
