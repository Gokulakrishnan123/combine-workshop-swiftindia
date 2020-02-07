//
//  Session4ViewController.swift
//  swiftindia-combine-workshop
//
//  Created by Ritesh Gupta on 07/02/20.
//  Copyright © 2020 Ritesh Gupta. All rights reserved.
//

import UIKit
import Combine

// Objectives
// 1. Complete UIControl.Publisher implementation
// 2. Update UILabels's text and color when the button is tapped

class Session4ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    lazy var buttonTapPublisher = button.eventPublisher(for: .touchUpInside)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UIControl {
    class Publisher: Combine.Publisher {
        typealias Output = UIControl.Event
        typealias Failure = Never

        init(control: UIControl, event: UIControl.Event) {
            control.addTarget(self, action: #selector(actionHandler), for: event)
        }

        @objc func actionHandler(sender: UIControl, forEvent event: UIControl.Event) {
        }

        func receive<S: Subscriber>(subscriber: S) where Failure == S.Failure, Output == S.Input {
        }
    }
}
