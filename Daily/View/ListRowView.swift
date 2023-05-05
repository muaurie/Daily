//
//  ListRowView.swift
//  Daily
//
//  Created by Cherish Spikes on 4/21/23.
//

import SwiftUI


struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            //Image(systemName: checkmark.circle)
            Text(title)
            Spacer()
            
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListRowView(title: "First Title")
        }
        
    }
}
