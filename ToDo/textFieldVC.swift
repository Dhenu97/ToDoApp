//
//  textFieldVC.swift
//  ToDo
//
//  Created by dhenu on 11/20/23.
//


import UIKit

struct Element {
    let taskName: String
    let taskDes: String
    let endDate: UIDatePicker
    let startDate: UIDatePicker
}

class textFieldVC: UIViewController, UITextFieldDelegate {
    var shoppingList: [String] = []
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endTimeDatePicker: UIDatePicker!
    @IBOutlet weak var textViewDescription: UITextView!
    var list = [Element]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textField.delegate = self
        UserDefaults.standard.set(false, forKey: "Key") //Bool
        

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addingTextField))
    }
    
    
    
    
    @objc func addingTextField() {
        UserDefaults.standard.set(true, forKey: "Key") //Bool



        if let item = textViewDescription.text, item.isEmpty == false { // need to make sure we have something here
            shoppingList.append(item) // store it in our data holder
        }
        textViewDescription.text = nil // clean the textfield input
        
        for product in shoppingList {
            print(product) // prints the items currently in the list
        }
       
        print("\(shoppingList.count)")
        UDWrite()
        let data = UDSaved()
        print(data)
        navigationController?.popViewController(animated: true)
    }
    
    
   
    
    func UDWrite() {
        UserDefaults.standard.set(shoppingList, forKey: "shoppingList")
        print("shoppingList1\(UserDefaults.standard.set(shoppingList, forKey: "shoppingList"))")
    }
    
    func UDSaved() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "shoppingList") ?? [String]()
    }


}


