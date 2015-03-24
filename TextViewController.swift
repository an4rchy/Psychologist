//
//  TextViewController.swift
//  Psychologist
//
//  Created by Penemetsa, Arjun on 3/24/15.
//  Copyright (c) 2015 Penemetsa, Arjun. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    var text:String = "" {
        didSet {
            textView?.text = text
        }
    }


    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            }
            else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue}
    }
    
    
}
