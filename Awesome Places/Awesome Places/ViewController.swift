//
//  ViewController.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 15/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeNameTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var iAmHereSwitch: UISwitch!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var starsSlider: UISlider!
    @IBOutlet weak var numberOfStarsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {

        let value = Int(sender.value)
        sender.value = Float(value)
        numberOfStarsLabel.text = "\(value)"
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
    }

    @IBAction func saveForm(_ sender: UIBarButtonItem) {
    }
}

