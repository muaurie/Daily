//
//  TaskViewController.swift
//  Daily
//
//  Created by Cherish Spikes on 5/5/23.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete Goal", style: .done, target: self, action: #selector(deleteGoal))
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func deleteGoal() {
        /*
         let newCount = count - 1
         UserDefaults().set(newCount, forKey: "count")
         UserDefaults().set(nil, forKey: "task_\(currentPosition)")
         }
         */
    }
    
    @objc func newTask() {
        
    }
    
    /* @IBAction func checkBoxTapped(_ sender: Any) {
        checkBoxButton.isSelected = !checkBoxButton.isSelected
        if checkBoxButton.isSelected {
            
        }
    } */
}
