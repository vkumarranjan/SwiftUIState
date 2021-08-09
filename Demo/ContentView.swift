//
//  ContentView.swift
//  Test1111
//
//  Created by Vinay Nation on 08/08/21.
//

import Foundation
import SwiftUI
import Combine



struct ContentView: View {
    // 1.
    @ObservedObject var stopwatch = Stopwatch()
    
    var body: some View {
        VStack {
            HStack {
                // 2.
                Button(action: {
                    self.stopwatch.start()
                }) {
                    Text("Start")
                }
                
                Button(action: {
                    self.stopwatch.stop()
                }) {
                    Text("Stop")
                }
                Button(action: {
                    self.stopwatch.reset()
                }) {
                    Text("Reset")
                }
            }
            // 3.
            Text("\(self.stopwatch.counter)")
        }.font(.largeTitle)
    }
}

// 1.
class Stopwatch: ObservableObject {
    // 2.
    @Published var counter: Int = 0
    
    var timer = Timer()
    
    // 3.
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.counter += 1
        }
    }
    
    // 4.
    func stop() {
        timer.invalidate()
    }
    
    // 5.
    func reset() {
        counter = 0
        timer.invalidate()
    }
}






//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
