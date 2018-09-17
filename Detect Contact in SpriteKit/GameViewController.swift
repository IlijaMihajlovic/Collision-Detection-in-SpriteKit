//
//  ViewController.swift
//  Detect Contact in SpriteKit
//
//  Created by Ilija Mihajlovic on 9/10/17.
//  Copyright © 2017 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    let skView: SKView = {
        let view = SKView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(skView)
        
        
        NSLayoutConstraint.activate([skView.topAnchor.constraint(equalTo:view.topAnchor),
        skView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        skView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        skView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        let scene = GameScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
        scene.scaleMode = .resizeFill
        
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
        skView.showsPhysics = true
        skView.showsNodeCount = true
        skView.showsFPS = true
    }

}

