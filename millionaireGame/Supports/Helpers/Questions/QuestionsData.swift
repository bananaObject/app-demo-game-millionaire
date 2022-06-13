//
//  QuestionsData.swift
//  millionaireGame
//
//  Created by Ke4a on 02.06.2022.
//

import Foundation

class QuestionsData {
    private let data = [
        QuestionModel(
            level: 0,
            question: "Чем обмениваются новобрачные в ЗАГСе?",
            answers: ["Телефонами",
                      "Фотографиями",
                      "Кольцами",
                      "Рукопожатиями"],
            correctAnswer: "Кольцами"),
        QuestionModel(
            level: 1,
            question: "Что делает парикмахер на голове клиента?",
            answers: ["Воронку",
                      "Стрижку",
                      "Попугайку",
                      "Ласточку"],
            correctAnswer: "Стрижку"),
        QuestionModel(
            level: 2,
            question: "Что держит в руке американская статуя Свободы?",
            answers: ["Фонарь",
                      "Канделябр",
                      "Факел",
                      "Зажигалку"],
            correctAnswer: "Факел"),
        QuestionModel(
            level: 3,
            question: "Что является характеристикой коллекционного вина?",
            answers: ["Стойкость",
                      "Выносливость",
                      "Выдержка",
                      "Трезвость"],
            correctAnswer: "Выдержка"),
        QuestionModel(
            level: 4,
            question: "Какая нота дважды встречалась в названии фильма Георгия Данелии?",
            answers: ["До",
                      "Ре",
                      "Фа",
                      "Ми"],
            correctAnswer: "Ми"),
        QuestionModel(
            level: 5,
            question: "В какое море впадает Хуанхэ — Жёлтая река?",
            answers: ["В Красное",
                      "В Жёлтое",
                      "В Белое",
                      "В Чёрное"],
            correctAnswer: "В Жёлтое"),
        QuestionModel(
            level: 6,
            question: "Кольцо какого цвета на олимпийском флаге символизирует Европу?",
            answers: ["Голубое",
                      "Жёлтое",
                      "Зелёное",
                      "Красное"],
            correctAnswer: "Голубое")]

    static var shared = QuestionsData()

    private init() {}

    func getData() -> [QuestionModel] {
        return data + GameLayer.shared.userQuestions
    }
}
