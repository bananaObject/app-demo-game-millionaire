//
//  GameHelper.swift
//  millionaireGame
//
//  Created by Ke4a on 29.05.2022.
//

import Foundation

struct Questions {
    let level: Int
    let questions: String
    let answers: [String]
    let correctAnswer: String
}

protocol GameHelper {
    var dataMoney: [String] { get }
    var dataQuestions: [Questions] { get }
}

extension GameHelper {
    // MARK: - Computed Properties
    var dataMoney: [String] {
        ["500", "1 000",
         "2 000", "3 000",
         "5 000", "10 000",
         "15 000", "25 000",
         "50 000", "100 000",
         "200 000", "400 000",
         "800 000", "1 500 000",
         "3 000 000"]
    }
    var dataQuestions: [Questions] { [
        Questions(
            level: 0,
            questions: "Чем обмениваются новобрачные в ЗАГСе?",
            answers: ["Телефонами",
                      "Фотографиями",
                      "Кольцами",
                      "Рукопожатиями"],
            correctAnswer: "Кольцами"),
        Questions(
            level: 1,
            questions: "Что делает парикмахер на голове клиента?",
            answers: ["Воронку",
                      "Стрижку",
                      "Попугайку",
                      "Ласточку"],
            correctAnswer: "Стрижку"),
        Questions(
            level: 2,
            questions: "Что держит в руке американская статуя Свободы?",
            answers: ["Фонарь",
                      "Канделябр",
                      "Факел",
                      "Зажигалку"],
            correctAnswer: "Факел"),
        Questions(
            level: 3,
            questions: "Что является характеристикой коллекционного вина?",
            answers: ["Стойкость",
                      "Выносливость",
                      "Выдержка",
                      "Трезвость"],
            correctAnswer: "Выдержка"),
        Questions(
            level: 4,
            questions: "Какая нота дважды встречалась в названии фильма Георгия Данелии?",
            answers: ["До",
                      "Ре",
                      "Фа",
                      "Ми"],
            correctAnswer: "Ми"),
        Questions(
            level: 5,
            questions: "В какое море впадает Хуанхэ — Жёлтая река?",
            answers: ["В Красное",
                      "В Жёлтое",
                      "В Белое",
                      "В Чёрное"],
            correctAnswer: "В Жёлтое"),
        Questions(
            level: 6,
            questions: "Кольцо какого цвета на олимпийском флаге символизирует Европу?",
            answers: ["Голубое",
                      "Жёлтое",
                      "Зелёное",
                      "Красное"],
            correctAnswer: "Голубое")]
    }
}
