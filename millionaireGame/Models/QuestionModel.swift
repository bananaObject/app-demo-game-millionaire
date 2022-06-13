//
//  QuestionModel.swift
//  millionaireGame
//
//  Created by Ke4a on 31.05.2022.
//

import Foundation

struct QuestionModel: CaretakerModelMarker {
    let level: Int
    let question: String
    let answers: [String]
    let correctAnswer: String
}
