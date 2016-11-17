//
//  ListTableViewController.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 17/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    let directory = Directory.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...10 {
            let place = Place(name: "Test \(i)", address: "Test adress \(i)", phoneNumber: "0000000", stars: 2.6, numberOfReviews: 1)
            directory.add(place)
        }

        print("Liste affichée")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // On récupère le nombre d'éléments à afficher dans le modèle, et on les donne au Table View
        return directory.allPlaces.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // On récupère une cellule réutilisable (potentiellement recyclée) correspondant à l'indetifiant placeCell, qui correspond à l'indentifiant chois pour la cellule dans le storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)

        // On identifie le lieu à afficher pour cette cellule, grace à son numero de ligne (indexPath.row)
        let place = directory.allPlaces[indexPath.row]

        // On configure la cellule avec les infos du lieu
        cell.textLabel?.text = place.name
        cell.detailTextLabel?.text = place.address

        print("Just returned a cell")

        // On retourne la cellule au Table View pour qu'il l'affiche
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
