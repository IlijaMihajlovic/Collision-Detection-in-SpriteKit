//
//  PhysicsCategory.swift
//  Detect Contact in SpriteKit
//
//  Created by Ilija Mihajlovic on 9/10/17.
//  Copyright © 2017 Ilija Mihajlovic. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    
    static let Player: UInt32 = 0b1     // 1
    static let Enemy: UInt32 = 0b1 << 1 // 2
}
