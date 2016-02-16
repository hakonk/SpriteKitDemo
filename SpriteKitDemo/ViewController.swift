//
//  ViewController.swift
//  SpriteKitDemo
//
//  Created by Håkon Knutzen on 15/02/16.
//  Copyright © 2016 Netlight. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = SKScene(fileNamed:"MainScene") {
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            let action = SKAction(named: "rotateAndScale")
            scene.scaleMode = .AspectFill
            let netlightLogo = scene.childNodeWithName("SKSpriteNode_0")
            skView.presentScene(scene)
            netlightLogo?.runAction(SKAction.repeatActionForever(action!))
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

