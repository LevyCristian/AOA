//
//  Settings.swift
//  Asteroid LOFI
//
//  Created by aluno on 24/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

struct Settings {
    struct Metrics {
       
    }
    struct Game {
        static let gravity = CGVector(dx: 0,dy: -9.8)
        static let playerOrign = CGPoint(x:UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
    }
}
