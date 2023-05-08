//
//  EntryViewController.swift
//  Daily
//
//  Created by Cherish Spikes on 5/5/23.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var field: UITextField!
    
    var update: (()-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        // Do any additional setup after loading the view.
        
        //add save button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target:self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }

    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        //save a count of number of tasks
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popToRootViewController(animated: true)
        //save each task with a given number
    }

}
