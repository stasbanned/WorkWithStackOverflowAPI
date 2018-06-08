//
//  DataTableVC.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 07.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class DataTableVC: UITableViewController {
    var arrayWithData = [Items]()
    var indexOfSelectedRow = 0
    var archive: [Archive]?
    var isDataInCD = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(arrayWithData)
        //print(arrayWithData.count)
        self.title = "Data Table"
        archive = Archive.fetchObject()
        for i in arrayWithData {
            isDataInCD = false
            for j in archive! {
                if j.title == i.title {
                    isDataInCD = true
                }
            }
            if isDataInCD == false {
                Archive.saveObject(link: i.link, ownerLink: i.owner.link, ownerName: i.owner.display_name,
                                   tags: i.tags, title: i.title)
            }
        }

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayWithData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrayWithData[indexPath.row].title
        cell.detailTextLabel?.text = arrayWithData[indexPath.row].owner.display_name
        print(arrayWithData[indexPath.row].title)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailDataVC
        destination.questionLink = arrayWithData[indexOfSelectedRow].link
        destination.authorLink = arrayWithData[indexOfSelectedRow].owner.link
        destination.tags = arrayWithData[indexOfSelectedRow].tags
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexOfSelectedRow = indexPath.row
        performSegue(withIdentifier: "toDetailData", sender: self)
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
