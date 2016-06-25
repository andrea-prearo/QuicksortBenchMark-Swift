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
    let shortDescription: String
    var executionTime: NSTimeInterval
    let handler: SortingAlgorithmHandler

    init(description: String, handler: SortingAlgorithmHandler) {
        self.shortDescription = description
        self.executionTime = 0
        self.handler = handler
    }
    
    mutating func execute(date date: NSDate) -> [Int] {
        let output = handler()
        executionTime = NSDate().timeIntervalSinceDate(date) * Double(1000)
        return output
    }
    
    var executionDetails: String {
        return "T \(shortDescription) = \(executionTime) msec"
    }

    var processingDescription: String {
        return "Executing \(shortDescription)..."
    }
}
