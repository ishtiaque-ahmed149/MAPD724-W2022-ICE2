//
//  GameScene.swift
//  MAPD724-W2022-ICE1
//
//  Created by Ishtiaque Ahmed on 1/22/22.
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    // instance variables
    var ocean: Ocean?
    var plane: Plane?
    var island: Island?
    var clouds: [Cloud] = []
      
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        // add ocean to the scene
        ocean = Ocean() // allocate memory
        ocean?.position = CGPoint(x: 0, y: 773)
        addChild(ocean!) // add the ocean to the scene
        
        // add plane to the scene
        plane = Plane()
        plane?.position = CGPoint(x: 0, y: -495)
        addChild(plane!)
        
        // add island to the scene
        island = Island()
        addChild(island!)
        
        // add 3 clouds to the scene
        for index in 0...2
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean?.Update()
        plane?.Update()
        island?.Update() //island update
        
        // update each cloud in clouds
        for cloud in clouds
        {
            cloud.Update()
        }
    }
}
