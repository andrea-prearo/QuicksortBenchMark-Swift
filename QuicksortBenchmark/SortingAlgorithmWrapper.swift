//
//  SortingAlgorithmWrapper
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 6/25/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

typealias SortingAlgorithmHandler = () -> [Int]

struct SortingAlgorithmWrapper {
    static let defaultTestRuns = UInt(5)

    let shortDescription: String
    let handler: SortingAlgorithmHandler
    let testRuns: UInt
    var executionTime: NSTimeInterval
    var maxDeltaTime: NSTimeInterval

    init(description: String, handler: SortingAlgorithmHandler) {
        self.shortDescription = description
        self.testRuns = SortingAlgorithmWrapper.defaultTestRuns
        self.handler = handler
        self.executionTime = 0
        self.maxDeltaTime = 0
    }

    init(description: String, testRuns: UInt, handler: SortingAlgorithmHandler) {
        self.shortDescription = description
        if testRuns > 0 {
            self.testRuns = testRuns
        } else {
            self.testRuns = SortingAlgorithmWrapper.defaultTestRuns
        }
        self.handler = handler
        self.executionTime = 0
        self.maxDeltaTime = 0
    }
    
    mutating func execute() -> [Int] {
        var start: NSDate
        var output = [Int]()
        var runtime = [NSTimeInterval]()
        executionTime = 0
        for _ in 0..<testRuns {
            start = NSDate()
            output = handler()
            let time = NSDate().timeIntervalSinceDate(start) * NSTimeInterval(1000)
            executionTime += time
            runtime.append(time)
        }
        if testRuns > 1 {
            executionTime = executionTime / NSTimeInterval(testRuns)
        }
        for i in 0..<testRuns {
            let deltaTime = fabs(runtime[Int(i)] - executionTime) * NSTimeInterval(0.5)
            if deltaTime > maxDeltaTime {
                maxDeltaTime = deltaTime
            }
        }
        return output
    }
    
    var executionDetails: String {
        return String(format: "T %@ = %.3f msec (max \u{394} = %.3f msec)", shortDescription, executionTime, maxDeltaTime)
    }

    var processingDescription: String {
        return "Executing \(shortDescription) (\(testRuns) runs)..."
    }
}
