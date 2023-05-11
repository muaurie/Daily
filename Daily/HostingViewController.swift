//
//  HostingViewController.swift
//  Daily
//
//  Created by Cherish Spikes on 5/10/23.
//
import SwiftUI


class CountdownViewModel: ObservableObject {
    @Published var isActive = false
    @Published var showingAlert = false
    @Published var time: String = "5:00"
    @Published var minutes: Float = 5.0 {
        didSet {
            self.time = "\(Int(minutes)):00"
        }
    }
    private var initialTime = 0
    private var endDate = Date()
    
    func start(minutes: Float) {
        self.initialTime = Int(minutes)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
    }
    
    func reset() {
        self.minutes = Float(initialTime)
        self.isActive = false
        self.time = "\(Int(minutes)):00"
    }
    
    //format
    func updateCountdown() {
        guard isActive else {return}
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        if diff <= 0 {
            self.isActive = false
            self.time = "0:00"
            self.showingAlert = true
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        self.minutes = Float(minutes)
        self.time = String(format: "%d:%02d", minutes, seconds)
    }
}

class HostingViewController: UIHostingController<Text>{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    struct HostingViewController_Previews:
        PreviewProvider {
        static var previews: some View {
            Text("Hello")
        }
        
    }
    
    struct TimerView: View {
        @StateObject private var vm = CountdownViewModel()
        private let timer = Timer.publish(every: 1, on: RunLoop.main, in: .common).autoconnect()
        private let width: Double = 250
        
        var body: some View {
            VStack {
                Text("\(vm.time)")
                    .font(.system(size: 70, weight: .medium, design: .rounded))
                    .padding()
                    .frame(width: width)
                    .background(.thinMaterial)
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

    
}
