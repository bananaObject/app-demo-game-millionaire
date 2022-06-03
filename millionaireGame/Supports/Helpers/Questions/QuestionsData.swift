//
//  QuestionsData.swift
//  millionaireGame
//
//  Created by Ke4a on 02.06.2022.
//

import Foundation

class QuestionsData {
    private let data = [
        QuestionsModel(
            level: 0,
            questions: "Чем обмениваются новобрачные в ЗАГСе?",
            answers: ["Телефонами",
                      "Фотографиями",
                      "Кольцами",
                      "Рукопожатиями"],
            correctAnswer: "Кольцами"),
        QuestionsModel(
            level: 1,
            questions: "Что делает парикмахер на голове клиента?",
            answers: ["Воронку",
                      "Стрижку",
                      "Попугайку",
                      "Ласточку"],
            correctAnswer: "Стрижку"),
        QuestionsModel(
            level: 2,
            questions: "Что держит в руке американская статуя Свободы?",
            answers: ["Фонарь",
                      "Канделябр",
                      "Факел",
                      "Зажигалку"],
            correctAnswer: "Факел"),
        QuestionsModel(
            level: 3,
            questions: "Что является характеристикой коллекционного вина?",
            answers: ["Стойкость",
                      "Выносливость",
                      "Выдержка",
                      "Трезвость"],
            correctAnswer: "Выдержка"),
        QuestionsModel(
            level: 4,
            questions: "Какая нота дважды встречалась в названии фильма Георгия Данелии?",
            answers: ["До",
                      "Ре",
                      "Фа",
                      "Ми"],
            correctAnswer: "Ми"),
        QuestionsModel(
            level: 5,
            questions: "В какое море впадает Хуанхэ — Жёлтая река?",
            answers: ["В Красное",
                      "В Жёлтое",
                      "В Белое",
                      "В Чёрное"],
            correctAnswer: "В Жёлтое"),
        QuestionsModel(
            level: 6,
            questions: "Кольцо какого цвета на олимпийском флаге символизирует Европу?",
            answers: ["Голубое",
                      "Жёлтое",
                      "Зелёное",
                      "Красное"],
            correctAnswer: "Голубое")]

    static var shared = QuestionsData()

    private init() {}

    func getData() -> [QuestionsModel] {
        return data
    }
}
