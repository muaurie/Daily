//
//  ViewController2.swift
//  Daily
//
//  Created by Cherish Spikes on 4/24/23.
//

import UIKit
import Foundation


class ViewController2: UIViewController {

    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTask: UIButton!
    @IBOutlet weak var createToDo: UIButton!
    
    
    var tasks = [String]()
    var toDoItem = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //get current saved tasks
        self.title = "Goals"
        
        
        guard let tableView = self.tableView else {
            print("tableView is nil")
            return
        }
       
        tableView.delegate = self
            
        tableView.dataSource = self
        //getData()
        
        //setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        // Do any additional setup after loading the view.
        updateTasks()
    }
    
    class HabitsTableViewController: UITableViewController {
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell: UITableViewCell
            if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
                cell = dequeueCell
            } else {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            cell.textLabel?.text = "Hello, world!"
            return cell
        }
    }

  
    /*
    // MARK: - Navigation
    */
    func updateTasks() {
        
        tasks.removeAll() //remove elemtns in task array so no dup.
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        for x in 0..<count {
            
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                tasks.append(task)
            }
        }
        
        tableView.reloadData()
    }
    
    @IBAction func didTapAdd() {

        //show another view controller as an entry
        //instantiate view controller
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Goal"
        vc.update = {
            //prioritize updating
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapCreateToDoItem(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "toDo") as! ToDoListViewController
        
        }
        
    }

    




extension ViewController2: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "Goal Details"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController2: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //deque a cell to get an instance of a cell and configure with data
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
