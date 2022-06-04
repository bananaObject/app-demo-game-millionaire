//
//  MyAssets.swift
//  millionaireGame
//
//  Created by Ke4a on 28.05.2022.
//

import UIKit

struct MyImage {
    static var logo: String {
        "logo"
    }
}

struct MyColor {
    static var main: UIColor {
        UIColor(named: "mainColor") ?? .red
    }

    static var border: UIColor {
        UIColor(named: "borderColor") ?? .blue
    }
}

struct MyFont {
    static var text: UIFont {
        UIFont(name: "Copperplate-Bold", size: 24) ?? .systemFont(ofSize: 24)
    }

    static var button: UIFont {
        UIFont(name: "Copperplate-Bold", size: 20) ?? .systemFont(ofSize: 16)
    }

    static var title: UIFont {
        UIFont(name: "Copperplate-Bold", size: 52) ?? .systemFont(ofSize: 20)
    }
}

enum MyError: Error {
    case getQuestionError
}
