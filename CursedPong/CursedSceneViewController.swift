//
//  CursedSceneViewController.swift
//  CursedPong
//
//  Created by Sima Nerush on 4/19/22.
//

import UIKit
import SceneKit
import GameplayKit

class CursedSceneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SCNView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SCNScene(named: "CursedScene") {
                // Set the scale mode to scale to fit the window
                
                // Present the scene
                view.present(scene, with: .crossFade(withDuration: 1), incomingPointOfView: SCNNode())
                
               
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

