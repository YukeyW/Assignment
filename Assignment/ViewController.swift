//
//  ViewController.swift
//  Assignment
//
//  Created by yukey on 5/6/20.
//  Copyright © 2020 Yukey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showCell(_ sender: Any) {
        ReusedViewController.show(delegate: self)
    }
}

extension ViewController: ReusedViewControllerDelegate {
    func labelContent(content: String) {
        label.text = content
    }
}

