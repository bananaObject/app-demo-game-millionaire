//
//  MainViewController.swift
//  millionaireGame
//
//  Created by Ke4a on 28.05.2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    // MARK: - Visual Components
    private let logoImageView: UIImageView = {
        let image = UIImage(named: MyAssetsImage.logo)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }()

    private lazy var continueGameButton: GameButton = {
        let button =  GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTextButton(text: "Continue game")
        button.addTarget(self, action: #selector(gameButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var newGameButton: GameButton = {
        let button =  GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTextButton(text: "New game")
        button.addTarget(self, action: #selector(gameButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var resultsButton: GameButton = {
        let button =  GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTextButton(text: "Results")
        button.addTarget(self, action: #selector(resultsButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Setting UI Methods
    private func setupUI() {
        view.backgroundColor = MyAssetsColor.mainColor

        view.addSubview(logoImageView)
        let topConstraint: NSLayoutConstraint = logoImageView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 100)
        topConstraint.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([
            topConstraint,
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
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

//        view.addSubview(continueGameButton)
//        NSLayoutConstraint.activate([
//            continueGameButton.bottomAnchor.constraint(equalTo: newGameButton.topAnchor, constant: -10),
//            continueGameButton.heightAnchor.constraint(equalToConstant: 50),
//            continueGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            continueGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
//        ])
    }

    // MARK: - Actions
    @objc func gameButtonAction() {
        newGameButton.animationColor(color: UIColor.yellow, duration: 0.2, repeatCount: 3, autoreverses: true)
    }

    @objc func resultsButtonAction() {
        resultsButton.animationColor(color: UIColor.yellow, duration: 0.2, repeatCount: 3, autoreverses: true)
    }
}
