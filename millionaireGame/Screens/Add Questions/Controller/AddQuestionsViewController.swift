//
//  AddQuestionsViewController.swift
//  millionaireGame
//
//  Created by Ke4a on 04.06.2022.
//

import UIKit

class AddQuestionsViewController: UIViewController {
    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.tintColor = MyColor.main
        button.layer.cornerRadius = 5.0
        button.layer.masksToBounds = true
        button.backgroundColor = MyColor.green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Private Properties

    private var dataTextField: [QuestionModel?] = []

    private var data: [QuestionModel?] {
        dataTextField + GameLayer.shared.userQuestions
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addNavigationBarButton()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AddQuestionsTextFieldTableViewCell.self,
                           forCellReuseIdentifier: AddQuestionsTextFieldTableViewCell.identifier)
        tableView.register(AddQuestionsLabelTableViewCell.self,
                           forCellReuseIdentifier: AddQuestionsLabelTableViewCell.identifier)
    }

    // MARK: - Setting UI Methods

    private func setupUI() {
        title = "Questions"
        navigationController?.navigationBar.backgroundColor = MyColor.main
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: MyFont.title]

        view.backgroundColor = MyColor.main
        tableView.backgroundColor = MyColor.main

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])

        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            addButton.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func addNavigationBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveButtonAction))
    }

    // MARK: - Actions

    @objc private func addButtonAction() {
        dataTextField.insert(nil, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
    }

    @objc private func saveButtonAction() {
        guard !dataTextField.isEmpty else { return }

        var questions: [QuestionModel] = []
        var deleteIndex: [IndexPath] = []
        var insertIndex: [IndexPath] = []

        for index in dataTextField.indices {
            deleteIndex.append(IndexPath(row: index, section: 0))

            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            as? AddQuestionsTextFieldTableViewCell

            do {
                if let question = try cell?.buildQuestion() {
                    insertIndex.append(IndexPath(row: insertIndex.count, section: 0))
                    questions.append(question)
                }
            } catch {
                print(error)
            }
        }

        dataTextField.removeAll()
        tableView.deleteRows(at: deleteIndex, with: .right)
        GameLayer.shared.addUserQuestion(questions)
        tableView.insertRows(at: insertIndex, with: .automatic)
    }
}

// MARK: - UITableViewDelegate

extension AddQuestionsViewController: UITableViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tableView.endEditing(false)
    }
}

// MARK: - Data Source

extension AddQuestionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let question = data[indexPath.row] {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AddQuestionsLabelTableViewCell.identifier,
                for: indexPath
            ) as? AddQuestionsLabelTableViewCell else { return UITableViewCell()}
            cell.delegate = self
            cell.configure(question)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AddQuestionsTextFieldTableViewCell.identifier,
                for: indexPath
            ) as? AddQuestionsTextFieldTableViewCell else { return UITableViewCell()}
            cell.delegate = self
            return cell
        }
    }
}

// MARK: - Delegate

extension AddQuestionsViewController: AddQuestionsBaseTableViewCellDelegate {
    func removeTextField(_ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }

        if cell is AddQuestionsLabelTableViewCell {
            GameLayer.shared.removeUserQuestion(indexPath.row - dataTextField.count)
        } else {
            dataTextField.remove(at: indexPath.row)
        }

        tableView.deleteRows(at: [indexPath], with: .right)
    }
}
