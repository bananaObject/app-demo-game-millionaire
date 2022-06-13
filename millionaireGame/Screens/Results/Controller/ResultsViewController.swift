//
//  ResultsViewController.swift
//  millionaireGame
//
//  Created by Ke4a on 31.05.2022.
//

import UIKit

final class ResultsViewController: UIViewController {
    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = MyColor.main
        return tableView
    }()

    // MARK: - Private Properties

    private let data = GameLayer.shared.results

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.dataSource = self
        // tableView.delegate = self
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
    }

    // MARK: - Setting UI Methods

    private func setupUI() {

        title = "Results"
        navigationController?.navigationBar.backgroundColor = MyColor.main
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: MyFont.title]

        view.backgroundColor = MyColor.main

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(
            withIdentifier: ResultTableViewCell.identifier,
            for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
        let result = data[indexPath.row]
        cell.configure(name: result.name, result: result.resultString)
        return cell
    }
}
