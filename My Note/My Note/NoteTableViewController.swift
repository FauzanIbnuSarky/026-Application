//
//  NoteTableViewController.swift
//  My Note
//
//  Created by muqorrobinaimar on 11/28/17.
//  Copyright © 2017 muqorrobin. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    var judulSelected:String?
    var isiSelected:String?
    
    var tasks: [Entity] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        let dataTask = tasks[indexPath.row]
        if let myDataTask = dataTask.judul {
            cell.judul.text = myDataTask
        }
        if let myDataTask1 = dataTask.isi {
            cell.isi.text = myDataTask1
        }
        
        // Configure the cell...
        
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    func getData() {
        do {
            tasks = try context.fetch(Entity.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row)selected")
        let dataTask = tasks[indexPath.row]
        judulSelected = dataTask.judul
        isiSelected = dataTask.isi
        performSegue(withIdentifier: "pass", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pass")
        {
            let kirimData = segue.destination as! MNoteViewController
            kirimData.passJudul = judulSelected
            kirimData.passIsi = isiSelected
            
        }
        
    }
    
    
}
