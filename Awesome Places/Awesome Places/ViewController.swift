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
    @IBOutlet weak var coordinatesStackView: UIStackView!
    @IBOutlet weak var downloadedImageView: UIImageView!

    let directory = Directory.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        guard let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4b/Jonathan_Swift_by_Charles_Jervas_detail.jpg") else { return }

        let compeltion = { (data: Data?, resp: URLResponse?, error: Error?) -> Void in
            guard let d = data, let image = UIImage(data: d) else { return }
            DispatchQueue.main.async {
                self.downloadedImageView.image = image
            }
        }

        let imageTask = URLSession.shared.dataTask(with: url, completionHandler: compeltion)

        imageTask.resume()
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

        dismiss(animated: true, completion: nil)
    }
// https://github.com/eLud/human-coders-paris

    @IBAction func saveForm(_ sender: UIBarButtonItem) {

        guard let name = placeNameTextField.text else { return }
        guard let address = addressTextField.text else { return }
        guard let phone = phoneNumberTextField.text else { return }
        guard let latitude = latitudeTextField.text, let latDouble = Double(latitude) else { return }
        guard let longitude = longitudeTextField.text, let longDouble = Double(longitude) else { return }
        guard let websiteUrlString = websiteTextField.text else { return }
        let websiteURL = URL(string: websiteUrlString)
        let note = starsSlider.value

        let place = Place(name: name, latitude: latDouble, longitude: longDouble, address: address, phoneNumber: phone, website: websiteURL, wikipedia: nil, stars: note, numberOfReviews: 1, origin: .local)

        print("Le lieu \(place.name) a été créé")

        directory.add(place)

        print(directory.allPlaces)

        dismiss(animated: true, completion: nil)
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {

        let animations = { () -> Void in
            self.coordinatesStackView.isHidden = sender.isOn
        }

        UIView.animate(withDuration: 0.2, animations: animations)

    }
}
