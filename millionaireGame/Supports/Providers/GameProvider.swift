//
//  GameProvider.swift
//  millionaireGame
//
//  Created by Ke4a on 29.05.2022.
//

import Foundation

final class GameProvider {
    // MARK: - Computed Properties

    var money: [String] {
        ["500", "1 000",
         "2 000", "3 000",
         "5 000", "10 000",
         "15 000", "25 000",
         "50 000", "100 000",
         "200 000", "400 000",
         "800 000", "1 500 000",
         "3 000 000"]
    }

    // MARK: - Private Properties

    private let questionStrategy: QuestionsStrategy

    init() {
        let difficulty = GameLayer.shared.difficulty

        switch difficulty {
        case .easy:
            questionStrategy = Questions()
        case .normal, .hard:
            questionStrategy = QuestionsRandom()
        }
    }

    // MARK: - Public Methods
    func levelUp() {
        GameLayer.shared.session?.level.value += 1
    }

    func endgame() {
        GameLayer.shared.endGame()
    }

    func writeHistoryAnswer(question: String, userAnswer answer: String) {
        GameLayer.shared.session?.history.append([question, answer])
    }

    func getQuestion(_ level: Int) throws -> QuestionModel {
        return try questionStrategy.getQuestion(level: level)
    }
}
