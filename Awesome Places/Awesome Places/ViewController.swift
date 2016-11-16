//
//  ViewController.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 15/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var destinationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func demo(_ sender: UIButton) {
        destinationLabel.text = sourceTextField.text
    }

}

