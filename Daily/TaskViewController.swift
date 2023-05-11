//
//  TaskViewController.swift
//  Daily
//
//  Created by Cherish Spikes on 5/5/23.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var toDoTextField: UITextField!
    
    var task: String?
    var toDo: String?
    
    @IBOutlet weak var submitTodo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete Goal", style: .done, target: self, action: #selector(deleteGoal))
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapSubmitToDo(_ sender: Any) {
        var toDotext = toDoTextField.text
        
    }
}
