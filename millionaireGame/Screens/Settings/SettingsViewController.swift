//
//  SettingsViewController.swift
//  millionaireGame
//
//  Created by Ke4a on 04.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - Visual Components

    private let segmentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = MyFont.title
        label.textColor = .white
        label.text = "Difficult"
        return label
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.tintColor = MyColor.border
        control.selectedSegmentTintColor = MyColor.green
        control.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.white],
            for: UIControl.State.normal)

        control.addTarget(self, action: #selector(handleSegmentedControlChange(_: )), for: .valueChanged)
        return control
    }()

    private let difficultyCases = Difficulty.allCases

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSegmentControl()
    }

    // MARK: - Setting UI Methods

    private func setupUI() {
        view.backgroundColor = MyColor.main

        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])

        view.addSubview(segmentLabel)
        NSLayoutConstraint.activate([
            segmentLabel.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor),
            segmentLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    private func setupSegmentControl() {
        difficultyCases.enumerated().forEach { (index, value) in
            segmentedControl.insertSegment(withTitle: value.rawValue, at: index, animated: true)
        }

        if let index = difficultyCases.firstIndex(of: GameLayer.shared.difficulty) {
            segmentedControl.selectedSegmentIndex = index
        }
    }

    // MARK: - Actions

    @objc private func handleSegmentedControlChange(_ sender: UISegmentedControl) {
        let difficulty = difficultyCases[sender.selectedSegmentIndex]
        GameLayer.shared.changeDifficulty(difficulty)
    }

}
