//
//  TimerView.swift
//  Daily
//
//  Created by Cherish Spikes on 5/10/23.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: RunLoop.main, in: .common).autoconnect()
    private let width: Double = 250
    
    var body: some View {
        VStack {
            Text("\(vm.time)")
                .font(.system(size: 100, weight: .thin, design: .rounded))
                .padding()
                .frame(width: 500, height: 500)
                .background(
                        Image("aurora")
                            .resizable()
                            .frame(width: 300, height: 500)
                            .scaledToFill()
                )
                .foregroundColor(.white)
                .cornerRadius(20)
                .alert("Timer done!", isPresented: $vm.showingAlert) {
                    Button("Continue", role: .cancel) {
                        
                    }
                }
            Slider(value: $vm.minutes, in: 1...60, step: 1)
                .padding()
                .frame(width: width)
                .disabled(vm.isActive)
                .animation(.easeInOut, value: vm.minutes)
            
            HStack(spacing: 50) {
                Button("Start") {
                    vm.start(minutes: vm.minutes)
                }
                .disabled(vm.isActive)
                
                Button("Reset", action: vm.reset)
                    .tint(.red)
            }
            .frame(width:width)
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}


