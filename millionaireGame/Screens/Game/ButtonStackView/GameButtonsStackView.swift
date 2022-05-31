//
//  GameButtonsView.swift
//  millionaireGame
//
//  Created by Ke4a on 29.05.2022.
//

import UIKit

protocol GameButtonsStackViewProtocol: AnyObject {
    func endGame(userAnswer: String)
    func levelUp(userAnswer: String)
}

final class GameButtonsStackView: UIStackView {
    // MARK: - Public Properties
    weak var delegate: GameButtonsStackViewProtocol?

    // MARK: - Private Properties
    private var buttonsStack: [GameButton] = [GameButton(), GameButton(), GameButton(), GameButton()]
    private var correctButton: GameButton?

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    func configure(answers: [String], _ correctAnswer: String) {
        for (index, button) in buttonsStack.enumerated() {
            button.prepareForReuse()
            button.setTextButton(text: answers[index])

            if answers[index] == correctAnswer {
                self.correctButton = button
            }
        }
    }

    // MARK: - Private Methods
    private func setupUI() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 30
        buttonsStack.forEach { button in
            addArrangedSubview(button)
            button.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
        }
    }

    private func correctAnswer(_ button: GameButton) {
        Task {
            await button.animationChoiceAsync(fixColor: true)
            try await Task.sleep(nanoseconds: 500_000_000)
            await button.animationAnswerAsync(isCorrectAnswer: true, fixColor: true)
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let userAnswer = button.titleLabel?.text ?? "error"
            delegate?.levelUp(userAnswer: userAnswer)
        }
    }

    private func wrongAnswer(_ button: GameButton) {
        Task {
            await button.animationChoiceAsync(fixColor: true)
            try await Task.sleep(nanoseconds: 500_000_000)
            await button.animationAnswerAsync(isCorrectAnswer: false, fixColor: true)
            await correctButton?.animationAnswerAsync(isCorrectAnswer: true, fixColor: true)
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let userAnswer = button.titleLabel?.text ?? "error"
            delegate?.endGame(userAnswer: userAnswer)
        }
    }

    // MARK: - Actions
    @objc func buttonAction(_ sender: GameButton) {
        if correctButton == sender {
            correctAnswer(sender)
        } else {
            wrongAnswer(sender)
        }
    }
}
