//
//  ViewController.swift
//  ToDo
//
//  Created by dhenu on 11/20/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var animationView: UIImageView?
    var items: [String] = []
    var dictionary = [:] as [String : Any]?
    var list:  [(String, String, String, String)] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.removeObject(forKey: "Key")
        setGradientBackground()
        tableView.layer.cornerRadius = 10
        animationView?.layer.cornerRadius = 10
        refreshData()
        navigationItem.title = "ToDo"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        print(list.count)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
            refreshData()
        print("fcsd\(list.count)")
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        setGradientBackground()
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 85.0/255.0, green: 186.0/255.0, blue: 240.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 198.0/255.0, green: 233.0/255.0, blue: 253.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func refreshData() {
        if  UserDefaults.standard.bool(forKey: "Key") == true {
//            let userDefaults = UserDefaults.standard
//            let dictValue = UserDefaults.standard.value(forKey: "myKey") as! [String : Any]//Retrieving the value from user default
//            dictionary = dictValue
            let array = UserDefaults.standard.stringArray(forKey: "shoppingList") ?? [String]()
            self.items.append(contentsOf: array)
            print("\(items.count) \(items)")
        }
        self.tableView.reloadData()
        
    }
    
    @IBAction func addTask(_ sender: Any) {
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "textfield") as? textFieldVC
        ViewController?.navigationItem.title = "Add Task"
        self.navigationController?.pushViewController(ViewController!, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("items.count\(items.count)")
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.layer.cornerRadius = 9
        cell.layer.shadowOffset = CGSizeMake(0, 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4
        DispatchQueue.main.async {
            cell.taskDescriptionLbl.text = self.items[indexPath.row]
    
                    }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "tasks") as? TaskDetailVC
        DispatchQueue.main.async {
            
            vc?.lbl1?.text = self.items[indexPath.row]
            vc?.lbl1?.sizeToFit()
        }
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
        
    
}


