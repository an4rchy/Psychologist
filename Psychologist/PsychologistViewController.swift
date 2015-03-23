//
//  ViewController.swift
//  Psychologist
//
//  Created by Penemetsa, Arjun on 3/23/15.
//  Copyright (c) 2015 Penemetsa, Arjun. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as?UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad":
                hvc.happiness = 0
                case "happy":
                hvc.happiness = 100
                default:
                hvc.happiness = 50
                }
            }
        }
    }

}

