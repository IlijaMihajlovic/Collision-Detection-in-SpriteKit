//
//  GameScene.swift
//  Detect Contact in SpriteKit
//
//  Created by Ilija Mihajlovic on 9/10/17.
//  Copyright © 2017 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode()
    var enemy = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsWorld.contactDelegate = self
        self.backgroundColor = SKColor.black
        
        setupPlayerNode()
        setupEnemyNode()
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Player" {
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Enemy" {
            print("Contact Detected")
        }
        
    }
    
    
    func setupPlayerNode() {
        player = SKSpriteNode(imageNamed: "spaceship")
        player.name = "Player"
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.size = CGSize(width: 200, height: 120)
        player.position = CGPoint(x: 0, y: -200)
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.isDynamic = false
        player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        player.physicsBody?.collisionBitMask = PhysicsCategory.Enemy
        player.physicsBody?.contactTestBitMask = PhysicsCategory.Enemy
        
        self.addChild(player)
    }
    
    func setupEnemyNode() {
        enemy = SKSpriteNode(imageNamed: "spaceshipTwo")
        enemy.name = "Enemy"
        enemy.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        enemy.size = CGSize(width: 110, height: 120)
        enemy.position = CGPoint(x: 0, y: 430)
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 3)
        enemy.physicsBody?.affectedByGravity = true
        enemy.physicsBody?.categoryBitMask = PhysicsCategory.Enemy
        
        self.addChild(enemy)
    }
    
}
