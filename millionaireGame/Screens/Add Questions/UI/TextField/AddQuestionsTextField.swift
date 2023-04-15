//
//  AddQuestionsTextField.swift
//  millionaireGame
//
//  Created by Ke4a on 12.06.2022.
//

import UIKit

class AddQuestionsTextField: UITextField {
    // MARK: - Initialization

    init(_ part: PartQuestion, returnKeyType: UIReturnKeyType) {
        super.init(frame: .zero)
        setupUI()
        setPlaceholder(part)
        self.returnKeyType = returnKeyType
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setText(_ text: String) {
        self.text = text
    }

    // MARK: - Setting UI Methods

    private func setupUI() {
        font = MyFont.question
        layer.borderWidth = 1
        layer.borderColor = MyColor.border.cgColor
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }

    // MARK: - Private Methods

    private func setPlaceholder(_ part: PartQuestion) {
        let placeholderText: NSAttributedString?

        switch part {
        case .correctAnswer:
            textColor = MyColor.green
            placeholderText = NSAttributedString(
                string: "## Введите верный ответ ##",
                attributes: [NSAttributedString.Key.foregroundColor: MyColor.green.withAlphaComponent(0.5)])
        case .wrongAnswer:
            textColor = MyColor.red
           placeholderText = NSAttributedString(
                string: "## Введите неверный ответ ##",
                attributes: [NSAttributedString.Key.foregroundColor: MyColor.red.withAlphaComponent(0.5)])
        case .question:
            textColor = .white
            placeholderText = NSAttributedString(
                string: "## Введите вопрос ##",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        }

        attributedPlaceholder = placeholderText
    }
}
