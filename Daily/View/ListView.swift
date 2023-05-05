//
//  To-Do_ListView.swift
//  Daily
//
//  Created by Cherish Spikes on 4/19/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first title.",
        "This is the second.",
        "This is the third.",
        "And so on..",
        "And so on..",
    
        
    ]
    
    var body: some View {
        TabView {
            List {
                ForEach(items, id: \.self) { item in
                    ListRowView(title: item)
                }
                
            }
            //possible navbar switch between views
            //View(A)
            tabItem() {
                    Image(systemName: "home.png")
                    Text("Home")
                    
                }
            //View(B)
            tabItem() {
                Image(systemName: "home.png")
                Text("Clock")
                
            }
            //View(C)
            tabItem() {
                Image(systemName: "home.png")
                Text("To Do")
                
            }
        }
        .navigationTitle("Goals")
        .navigationBarItems(
            trailing:
                NavigationLink("Add", destination: Text("Destination")
        )

    )

    }
}

struct To_Do_ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        
    }
}

