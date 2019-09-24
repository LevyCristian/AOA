//
//  GameScene.swift
//  Asteroid LOFI
//
//  Created by aluno on 20/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    /** O node responsável pelo estilingue. */
      private lazy var nave: SKSpriteNode = {
        let slingshot_1 = SKSpriteNode(imageNamed: "nave")
        slingshot_1.position = Settings.Game.playerOrign
          
        return slingshot_1
      }()
      
    
    override func didMove(to view: SKView) {
        
        addChild(nave)
    }
    
     
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
