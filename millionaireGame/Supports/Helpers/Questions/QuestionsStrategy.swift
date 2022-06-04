//
//  QuestionsStrategy.swift
//  millionaireGame
//
//  Created by Ke4a on 02.06.2022.
//

import Foundation

protocol QuestionsStrategy {
    func getQuestions(level: Int) throws -> QuestionsModel
}

class Questions: QuestionsStrategy {
    private let data: [QuestionsModel] = QuestionsData.shared.getData()

    func getQuestions(level: Int) throws -> QuestionsModel {
        guard level <= data.count - 1 else { throw MyError.getQuestionError }

        return data[level]
    }
}

class QuestionsRandom: QuestionsStrategy {
    private var data: [QuestionsModel] = {
        var array = QuestionsData.shared.getData()
        return array.shuffled()
    }()

    func getQuestions(level: Int) throws -> QuestionsModel {
        guard level <= data.count - 1 else { throw MyError.getQuestionError }

        return data[level]
    }
}
