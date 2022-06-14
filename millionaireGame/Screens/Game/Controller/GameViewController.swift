//
//  GameViewController.swift
//  millionaireGame
//
//  Created by Ke4a on 29.05.2022.
//

import UIKit

final class GameViewController: UIViewController {
    // MARK: - Visual Components

    private let levelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = MyFont.title
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = MyFont.text
        label.textColor = .white
        return label
    }()

    private let buttonsStackView: GameButtonsStackView = {
        let view = GameButtonsStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Private Properties

    private let provider = GameProvider()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGame()
    }

    // MARK: - Setting UI Methods

    private func setupUI() {
        buttonsStackView.delegate = self

        view.backgroundColor = MyColor.main

        view.addSubview(levelLabel)
        NSLayoutConstraint.activate([
            levelLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            levelLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            levelLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.60)
        ])

        view.addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    // MARK: - Private Methods

    private func startGame() {
        Task {
            let name = await presentNameAlertAsync()
            GameLayer.shared.newGame(name: name)

            GameLayer.shared.session?.level.addObserver(
                self,
                options: [.new, .initial]
            ) { (level, _) in
                self.configure(level)
            }
        }
    }

    private func configure(_ level: Int) {
        let difficulty = GameLayer.shared.difficulty

        switch difficulty {
        case .easy:
            levelLabel.text = provider.money[level]
        case .normal, .hard:
            levelLabel.text = "\(level + 1)/15"
        }

        do {
            let question = try provider.getQuestion(level)
            textLabel.text = question.question
            buttonsStackView.configure(answers: question.answers, question.correctAnswer)
        } catch {
            print(error)
        }
    }

    private func presentNameAlertAsync() async -> String {
        return await withCheckedContinuation { continuation in
            let alert = UIAlertController(title: "Имя игрока", message: nil, preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "Введите ваше имя"
            }

            let action = UIAlertAction(title: "OK", style: .default) { [weak alert] (_) in
                guard let text = alert?.textFields?.first?.text else { return }

                if text.isEmpty {
                    guard let alert = alert else { return }
                    alert.message = "Вы не ввели имя"
                    self.present(alert, animated: true, completion: nil)
                } else {
                    continuation.resume(returning: text)
                }
            }
            alert.addAction(action)

            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - GameButtonsStackViewProtocol

extension GameViewController: GameButtonsStackViewProtocol {
    func levelUp(userAnswer: String) {
        if let question = textLabel.text {
            provider.writeHistoryAnswer(question: question, userAnswer: userAnswer)
        }

        provider.levelUp()
    }

    func endGame(userAnswer: String) {
        if let question = textLabel.text {
            provider.writeHistoryAnswer(question: question, userAnswer: userAnswer)
        }
        provider.endgame()
        dismiss(animated: true)
    }
}
