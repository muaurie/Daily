//
//  Goal.swift
//  Daily
//
//  Created by Cherish Spikes on 4/19/23.
//

import Foundation

struct Goal {
    var goal: String
    var priorityNumber: Int
    
    func listGoal() {
        print("My goal is to \(goal) and this is my #\(priorityNumber) priority")
        

    }

    init(goal: String, priorityNumber: Int) {
        self.goal = goal
        self.priorityNumber = priorityNumber
    }
    
}
