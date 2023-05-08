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
    var toDo: String?
    
    @IBOutlet weak var submitTodo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete Goal", style: .done, target: self, action: #selector(deleteGoal))
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapSubmitToDo(_ sender: Any) {
        func updateToDo() {
            
        /*    toDo.removeAll() //remove elemtns in task array so no dup.
            
            guard let count = UserDefaults().value(forKey: "count") as? Int else{
                return
            }
            for x in 0..<count {
                
                if let task = UserDefaults().value(forKey: "toDo_\(x+1)") as? String {
                    toDo.append(task) */
                }
            }
        }

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
