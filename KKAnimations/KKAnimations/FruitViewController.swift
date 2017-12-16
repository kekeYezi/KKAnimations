//
//  FruitViewController.swift
//  KKAnimations
//
//  Created by keke on 2017/12/16.
//  Copyright © 2017年 keke. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class FruitViewController: UIViewController {
    
    var animator:UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fruit"
        
        self.view.backgroundColor = .white
        
        animator = UIDynamicAnimator.init(referenceView: self.view)
        
        var fruits:[UIView] = []
        for _ in 0...7 {
            let redView = UIView.init(frame: CGRect.init(x: (CGFloat(arc4random_uniform(200)) + 1) + 100, y:(CGFloat(arc4random_uniform(200)) + 1) + 100 , width: 50, height: 50))
            redView.backgroundColor = UIColor.init(
                red: (CGFloat(arc4random_uniform(255)) + 1) / 255,
                green: (CGFloat(arc4random_uniform(255)) + 1) / 255,
                blue: (CGFloat(arc4random_uniform(255)) + 1) / 255,
                alpha: 1)
            redView.layer.cornerRadius = 25
            redView.layer.masksToBounds = true
            self.view.addSubview(redView)
            fruits.append(redView)
            
            let pushBehavior = UIPushBehavior.init(items: [redView], mode: .instantaneous)
            pushBehavior.angle = (CGFloat(arc4random_uniform(100)) + 1) / 100
            pushBehavior.magnitude = 0.07
            pushBehavior.active = true
            animator!.addBehavior(pushBehavior)
        }
        
        let grayBehavior:UIGravityBehavior = UIGravityBehavior.init(items: fruits)
        grayBehavior.magnitude = 0.01
        
        let collision:UICollisionBehavior = UICollisionBehavior.init(items: fruits)
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionMode = .everything;
        
        let itemBehavior = UIDynamicItemBehavior.init(items: fruits)
        itemBehavior.elasticity = 1
        itemBehavior.friction = 0
        itemBehavior.density = 0.1
        itemBehavior.resistance = 0
        itemBehavior.allowsRotation = false
        
//        animator!.addBehavior(grayBehavior)
        animator!.addBehavior(collision)
        animator!.addBehavior(itemBehavior)

        
    }
}
