//
//  HappinessViewController.swift
//  HF
//
//  Created by Penemetsa, Arjun on 3/13/15.
//  Copyright (c) 2015 Penemetsa, Arjun. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    private struct Constants {
    static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int( translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0  {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    
    
    
    var happiness: Int = 75 {
        //0 is very sad, 100 is ecstatic
        didSet {
            happiness = min(max(happiness,0),100)
            println("Happiness = \(happiness)")
            updateUI()
            title = "\(happiness)"
        }
    }
    

private func updateUI()
        {
        faceView?.setNeedsDisplay()
        }
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50)/50
    }
}
