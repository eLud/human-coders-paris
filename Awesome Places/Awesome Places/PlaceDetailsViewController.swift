//
//  PlaceDetailsViewController.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 17/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

class PlaceDetailsViewController: UIViewController {

    var placeToDisplay: Place?

    @IBOutlet weak var placeName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }

    private func configureController() {
        placeName.text = placeToDisplay?.name
        title = placeToDisplay?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
