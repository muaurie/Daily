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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete Goal", style: .done, target: self, action: #selector(deleteTask))
        // Do any additional setup after loading the view.
    }
    
    
    @objc func deleteTask() {
        /*
         let newCount = count - 1
         UserDefaults().set(newCount, forKey: "count")
         UserDefaults().set(nil, forKey: "task_\(currentPosition)")
         }
         */
        
        
        
        
    }
}
