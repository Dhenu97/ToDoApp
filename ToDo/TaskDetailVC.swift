//
//  TaskDetailVC.swift
//  ToDo
//
//  Created by dhenu on 11/20/23.
//

import UIKit

class TaskDetailVC: UIViewController {
    
    @IBOutlet weak var lbl1: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Task Details"
        UserDefaults.standard.removeObject(forKey: "Key")
    }
    

    

}
