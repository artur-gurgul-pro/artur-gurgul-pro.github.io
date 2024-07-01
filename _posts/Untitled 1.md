```swift

import Combine
import Foundation

// Create a class or struct to manage your publisher
class PublisherManager {
    private var cancellable: AnyCancellable?
    
    init() {
        startPublisher()
    }
    
    private func startPublisher() {
        // Create a timer publisher that emits every 60 seconds
        let timerPublisher = Timer.publish(every: 60, on: .main, in: .default)
            .autoconnect()
        
        // Subscribe to the timer publisher
        cancellable = timerPublisher
            .sink { [weak self] _ in
                self?.executeTask()
            }
    }
    
    private func executeTask() {
        // Your task execution logic
        print("Task executed at \(Date())")
    }
    
    deinit {
        cancellable?.cancel()
    }
}

// Instantiate the PublisherManager
let manager = PublisherManager()

// Run the RunLoop to keep the playground running
RunLoop.main.run()

```