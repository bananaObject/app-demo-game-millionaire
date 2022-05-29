//
//  GameUIButton.swift
//  millionaireGame
//
//  Created by Ke4a on 28.05.2022.
//

import UIKit

class GameButton: UIButton {
    // MARK: - Computed Properties
    private var height: Double {
        frame.size.height
    }
    private var width: Double {
        frame.size.width
    }

    // MARK: - Private Properties
    private let shapeLayer = CAShapeLayer()
    private let bPath = UIBezierPath()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override Methods
    override func layoutSubviews() {
        super.layoutSubviews()

        shapeLayer.path = createBezierPathCGPath()
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // only allow tap *within* the bezier path
        if bPath.contains(point) {
            return self
        }
        return nil
    }

    // MARK: - Public Methods
    func setTextButton(text: String) {
        self.setTitle(text, for: .normal)
    }

    func animationColor(color: UIColor, duration: CFTimeInterval, repeatCount: Float, autoreverses: Bool = false) {
        let animcolor = CABasicAnimation(keyPath: "strokeColor")
        animcolor.fromValue = shapeLayer.strokeColor
        animcolor.toValue = color.cgColor
        animcolor.duration = duration
        animcolor.repeatCount = repeatCount
        animcolor.autoreverses = autoreverses
        animcolor.isRemovedOnCompletion = true
        shapeLayer.add(animcolor, forKey: "strokeColor")
    }

    // MARK: - Setting UI Methods
    private func setupUI() {
        layer.addSublayer(shapeLayer)

        shapeLayer.fillColor = backgroundColor?.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
    }

    // MARK: - Private Methods
    private func createBezierPathCGPath() -> CGPath {
        let line1 = CGPoint(x: width * 0.05, y: height / 2)
        let line2 = CGPoint(x: width * 0.15, y: height / 2)

        let line3 = CGPoint(x: width * 0.25, y: 0)
        let line4 = CGPoint(x: width * 0.75, y: 0)
        let line5 = CGPoint(x: width * 0.85, y: height / 2)
        let line6 = CGPoint(x: width * 0.75, y: height)
        let line7 = CGPoint(x: width * 0.25, y: height)

        let line8 = CGPoint(x: width * 0.15, y: height / 2)
        let line9 = CGPoint(x: width * 0.95, y: height / 2)

        bPath.move(to: line1)
        bPath.addLine(to: line2)
        bPath.close()

        bPath.move(to: line5)
        bPath.addLine(to: line9)
        bPath.close()

        bPath.move(to: line2)
        bPath.addLine(to: line3)
        bPath.addLine(to: line4)
        bPath.addLine(to: line5)
        bPath.addLine(to: line6)
        bPath.addLine(to: line7)
        bPath.addLine(to: line8)
        bPath.close()

        return bPath.cgPath
    }
}
