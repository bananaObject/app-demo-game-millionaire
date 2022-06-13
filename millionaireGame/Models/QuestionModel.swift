//
//  QuestionModel.swift
//  millionaireGame
//
//  Created by Ke4a on 31.05.2022.
//

import Foundation

struct QuestionModel: CaretakerModelMarker {
    var level: Int
    var question: String
    var answers: [String]
    var correctAnswer: String
}
