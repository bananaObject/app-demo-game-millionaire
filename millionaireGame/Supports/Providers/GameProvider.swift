//
//  GameProvider.swift
//  millionaireGame
//
//  Created by Ke4a on 29.05.2022.
//

import Foundation

enum Difficulty {
    case easy
    case normal
    case hard

}

final class GameProvider {
    // MARK: - Computed Properties

    var getMoney: String {
        ["500", "1 000",
         "2 000", "3 000",
         "5 000", "10 000",
         "15 000", "25 000",
         "50 000", "100 000",
         "200 000", "400 000",
         "800 000", "1 500 000",
         "3 000 000"][GameLayer.shared.session?.level ?? 0]
    }

    var getQuestion: QuestionsModel {
        let level = GameLayer.shared.session?.level
        return questionStrategy.getQuestions(level: level)
    }

    private let questionStrategy: QuestionsStrategy

    init(difficulty: Difficulty) {
        switch difficulty {
        case .easy:
            questionStrategy = Questions()
        case .normal, .hard:
            questionStrategy = QuestionsRandom()
        }
    }

    // MARK: - Public Methods
    func levelUp() {
        GameLayer.shared.session?.level += 1
    }

    func endgame() {
        GameLayer.shared.endGame()
    }

    func writeHistoryAnswer(userAnswer answer: String) {
        let question = getQuestion
        GameLayer.shared.session?.history.append([question.questions, answer])
    }
}
