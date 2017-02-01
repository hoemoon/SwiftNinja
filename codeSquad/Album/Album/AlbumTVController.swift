//
//  AlbumTVController.swift
//  Album
//
//  Created by hoemoon on 29/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class AlbumTVController: UITableViewController {
    var model = Model()
    var modelArray = [[String:String]]()
    var dateSortedSectionedArray = [[[String:String]]]()
    var row:Int = 0
    var toggle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        model.sortByTitle()
        self.navigationItem.title = "Album"
        let rightButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(sortByDateReload))
        self.navigationItem.rightBarButtonItem = rightButton
        
        // var navBar = self.navigationController?.navigationBar
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false0

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    func sortByDateReload() {
        // print("HELLO")
        if toggle == 0 {
//            modelArray = model.sortByDate()
            tableView.reloadData()
            toggle = 1
        } else {
//            modelArray = model.sortByTitle()
            tableView.reloadData()
            toggle = 0
        }
        print(modelArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return modelArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? AlbumTVCell
        row = indexPath.row
        cell?.cellImage.image = UIImage(named: modelArray[row]["image"]!)
        cell?.cellTitle.text = modelArray[row]["title"]
        cell?.cellDate.text = modelArray[row]["date"]
        
        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomHeaderCell
        headerCell.hederLabel.text = "test"
        
        return headerCell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toPhotoSegue" {
            let photoViewController = segue.destination as! PhotoViewController
            let myIndexPath = tableView.indexPathForSelectedRow
            let row = myIndexPath?.row
            photoViewController.imageString = modelArray[row!]["image"]!
            photoViewController.titleString = modelArray[row!]["title"]!
            photoViewController.date = modelArray[row!]["date"]!
        }
    }
    

}
