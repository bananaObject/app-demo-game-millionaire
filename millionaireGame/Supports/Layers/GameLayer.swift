//
//  GameLayer.swift
//  millionaireGame
//
//  Created by Ke4a on 30.05.2022.
//

import Foundation

enum Difficulty: String, CaseIterable {
    case easy
    case normal
    case hard
}

final class GameLayer: CaretakerLayer {
    // MARK: - Private Properties
    private var isInitial = true

    private(set) var session: GameSessionModel?
    private(set) var difficulty: Difficulty = .easy

    private(set) var userQuestions: [QuestionModel] = [] {
        didSet {
            if !isInitial {
                save(records: self.userQuestions, key: .userQuestion)
            }
        }
    }
    private(set) var results: [ResultModel] = [] {
        didSet {
            if !self.results.isEmpty {
                save(records: self.results, key: .records)
            }
        }
    }

    // MARK: - Static Properties

    static var shared = GameLayer()

    // MARK: - Initialization

    private override init() {
        super.init()
        session = nil

        let result = retrieveResults(key: .records) as? [ResultModel]
        self.results = result ?? []

        let userQuestion = retrieveResults(key: .userQuestion) as? [QuestionModel]
        self.userQuestions = userQuestion ?? []
        self.isInitial.toggle()
    }

    // MARK: - Public Methods

    func newGame(name: String) {
        session = GameSessionModel(name: name)
    }

    func endGame() {
        writeResult()
        session = nil
    }

    func changeDifficulty(_ difficulty: Difficulty) {
        self.difficulty = difficulty
    }

    func addUserQuestion(_ question: QuestionModel) {
        userQuestions.insert(question, at: 0)
    }

    func addUserQuestion(_ questions: [QuestionModel]) {
        userQuestions.insert(contentsOf: questions, at: 0)
    }

    func removeUserQuestion(_ index: Int) {
        userQuestions.remove(at: index)
    }

    // MARK: - Private Methods

    private func writeResult() {
        guard let session = session else { return }
        results.append(.init(name: session.name, level: session.level.value - 1))
    }
}
