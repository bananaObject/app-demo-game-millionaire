//
//  MainViewController.swift
//  millionaireGame
//
//  Created by Ke4a on 28.05.2022.
//

import UIKit

extension MainViewController {
    fileprivate enum Screen {
        case game
        case result
        case settings
    }
}

final class MainViewController: UIViewController {
    // MARK: - Visual Components

    private let logoImageView: UIImageView = {
        let image = UIImage(named: MyImage.logo)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }()

    // В будущем добавлю сохраннение игры
    private lazy var continueGameButton: GameButton = {
        let button =  GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTextButton(text: "Continue game")
        button.addTarget(self, action: #selector(buttonAction(_ : )), for: .touchUpInside)
        return button
    }()

    private lazy var newGameButton: GameButton = {
        let button =  GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTextButton(text: "New game")
        button.addTarget(self, action: #selector(buttonAction(_ : )), for: .touchUpInside)
        return button
    }()

    private lazy var resultsButton: GameButton = {
        let button =  GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTextButton(text: "Results")
        button.addTarget(self, action: #selector(buttonAction(_ : )), for: .touchUpInside)
        return button
    }()

    private lazy var settingsButton: UIButton = {
        var configuration = UIButton.Configuration.borderless()
        configuration.image = UIImage(systemName: "gearshape.fill")

        let button =  UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addButtonNavigationBar()
    }

    // MARK: - Setting UI Methods

    private func setupUI() {
        view.backgroundColor = MyColor.main

        view.addSubview(logoImageView)
        let topConstraint: NSLayoutConstraint = logoImageView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 100)
        topConstraint.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([
            topConstraint,
            logoImageView.heightAnchor.constraint(equalToConstant: 350),
            logoImageView.widthAnchor.constraint(equalToConstant: 350),
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        view.addSubview(newGameButton)
        NSLayoutConstraint.activate([
            newGameButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100),
            newGameButton.heightAnchor.constraint(equalToConstant: 50),
            newGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            newGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])

        view.addSubview(resultsButton)
        NSLayoutConstraint.activate([
            resultsButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 10),
            resultsButton.heightAnchor.constraint(equalTo: newGameButton.heightAnchor),
            resultsButton.leadingAnchor.constraint(equalTo: newGameButton.leadingAnchor),
            resultsButton.trailingAnchor.constraint(equalTo: newGameButton.trailingAnchor)
        ])

        /*
        view.addSubview(continueGameButton)
        NSLayoutConstraint.activate([
            continueGameButton.bottomAnchor.constraint(equalTo: newGameButton.topAnchor, constant: -10),
            continueGameButton.heightAnchor.constraint(equalToConstant: 50),
            continueGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            continueGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
         */
    }

    private func addButtonNavigationBar() {
        let addButton = UIBarButtonItem(
            image: UIImage(systemName: "gearshape.fill"),
            style: .plain, target: self,
            action: #selector(settingsButtonAction))
        addButton.tintColor = MyColor.border
        navigationItem.setRightBarButton(addButton, animated: true)
    }

    // MARK: - Private Methods

    private func presentScreen(screen: Screen) {
        switch screen {
        case .game:
            let controller = GameViewController()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
        case .result:
            let controller = ResultsViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .settings:
            let controller = SettingsViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    // MARK: - Actions

    @objc private func buttonAction(_ sender: GameButton) {
        Task {
            await sender.animationChoiceAsync(fixColor: false)
        }
        Task {
            await sender.animationAnswerAsync(isCorrectAnswer: true, fixColor: false)

            if sender == newGameButton {
                presentScreen(screen: .game)
            } else if sender == resultsButton {
                presentScreen(screen: .result)
            }
            sender.prepareForReuse()
        }
    }

    @objc private func settingsButtonAction() {
        presentScreen(screen: .settings)
    }
}
