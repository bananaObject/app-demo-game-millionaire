//
//  QuestionsStrategy.swift
//  millionaireGame
//
//  Created by Ke4a on 02.06.2022.
//

import Foundation

protocol QuestionsStrategy {
    func getQuestion(level: Int) throws -> QuestionModel
}

final class Questions: QuestionsStrategy {
    private let data: [QuestionModel] = QuestionsData.shared.getData()

    func getQuestion(level: Int) throws -> QuestionModel {
        guard level <= data.count - 1 else { throw MyError.getQuestionError }

        return data[level]
    }
}

final class QuestionsRandom: QuestionsStrategy {
    private var data: [QuestionModel] = {
        var array = QuestionsData.shared.getData()
        return array.shuffled()
    }()

    func getQuestion(level: Int) throws -> QuestionModel {
        guard level <= data.count - 1 else { throw MyError.getQuestionError }

        return data[level]
    }
}
