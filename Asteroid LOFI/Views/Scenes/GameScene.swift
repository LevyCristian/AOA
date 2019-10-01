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
    
    var rotation: CGFloat = 0
    var offset: CGFloat = 0
    
    /** O node responsável pelo estilingue. */
      private lazy var playerShip: SKSpriteNode = {
        guard let ship = self.childNode(withName: "playerShip") as? SKSpriteNode else { return SKSpriteNode()}
        
        return ship
      }()
      
    private lazy var rotationControl: UIRotationGestureRecognizer = {
        let rotation = UIRotationGestureRecognizer()
        rotation.addTarget(self, action: #selector(userDidRotateRotationControl(_:)))
        
        return rotation
    }()
    
    private lazy var bootControl: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.addTarget(self, action: #selector(userDidTapBootControl(_:)))
        
        return tap
    }()
    
    override func didMove(to view: SKView) {
        guard let view = self.view else{ return }
        view.addGestureRecognizer(rotationControl)
        view.addGestureRecognizer(bootControl)
    }
    
     
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    @objc func userDidRotateRotationControl(_ sender: UIRotationGestureRecognizer){
        
        switch sender.state{
        case .began:
            print("began")
            
        case .changed:
            rotation = (CGFloat(sender.rotation) + self.offset) * -1
            playerShip.zRotation = rotation
            
        case .ended:
            offset = playerShip.zRotation * -1
            
        case .cancelled:
            print("cancelled")
            
        case .failed:
            print("failed")
            
        case .possible:
            print("possible")
            
        @unknown default:
            print("wtf")
        }
    
    }
    
    @objc func userDidTapBootControl(_ sender: UITapGestureRecognizer){
           
            let dx = sin(rotation) * -10
            let dy = cos(rotation) * 10
       
            let vector = CGVector(dx: dx, dy: dy)
           
            playerShip.physicsBody?.applyForce(vector)
       }
    
}
