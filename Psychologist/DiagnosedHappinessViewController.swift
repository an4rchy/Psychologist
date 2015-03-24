//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Penemetsa, Arjun on 3/24/15.
//  Copyright (c) 2015 Penemetsa, Arjun. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get { return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? [] }
        set { defaults.setObject(newValue, forKey: History.DefaultsKey)}
    }
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    private struct History {
        static let SegueIdentifer = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifer = segue.identifier {
            switch identifer {
            case History.SegueIdentifer:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default:
                break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    
}
