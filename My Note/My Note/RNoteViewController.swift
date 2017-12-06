//
//  RNoteViewController.swift
//  My Note
//
//  Created by muqorrobinaimar on 11/28/17.
//  Copyright © 2017 muqorrobin. All rights reserved.
//

import UIKit

class RNoteViewController: UIViewController {
    @IBOutlet weak var inputjudul: UITextField!
    @IBOutlet weak var inputIsi: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Simpan(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let Task = Entity(context: context)
        Task.judul = inputjudul.text
        Task.isi = inputIsi.text
        if inputjudul.text == "" {
            let alert = UIAlertController(title: "Warning", message: "This Field Can't Be Empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!!!!", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}


