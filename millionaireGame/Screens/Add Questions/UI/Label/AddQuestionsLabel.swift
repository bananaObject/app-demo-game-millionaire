//
//  AddQuestionsLabel.swift
//  millionaireGame
//
//  Created by Ke4a on 13.06.2022.
//

import UIKit

class AddQuestionsLabel: UILabel {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setting UI Methods

    func setupUI() {
        font = MyFont.question
        layer.borderWidth = 2
        layer.borderColor = MyColor.border.cgColor
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }

    // MARK: - Public Methods

    func setColor(_ part: PartQuestion) {
        switch part {
        case .correctAnswer:
            textColor = MyColor.green
        case .wrongAnswer:
            textColor = MyColor.red
        case .question:
            textColor = .white
        }
    }

    func setText(_ text: String) {
        self.text = text
    }
}
