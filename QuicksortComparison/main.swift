//
//  main.swift
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 6/16/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

var test = [Int]()
for _ in 1...1000000 {
    test.append(Int(arc4random()))
}

var sorted: [Int]? = nil
var algorithms = [SortingAlgorithmWrapper]()
algorithms.append(SortingAlgorithmWrapper(description: "sort (Foundation Quicksort)") {
    let copy = test
    sorted = copy.sort()
    return sorted!
})
algorithms.append(SortingAlgorithmWrapper(description: "qsort1 (Functional Quicksort)") {
    let copy = test
    return qsort1(copy)
})
algorithms.append(SortingAlgorithmWrapper(description: "qsort2 (In-place Quicksort)") {
    var copy = test
    qsort2(&copy)
    return copy
})
algorithms.append(SortingAlgorithmWrapper(description: "qsort3 (In-place with partition Quicksort)") {
    var copy = test
    qsort3(&copy)
    return copy
})

for (index, item) in algorithms.enumerate() {
    let start = NSDate()
    print(algorithms[index].processingDescription)
    let result = algorithms[index].execute(date: start)
    if let sorted = sorted {
        assert(result == sorted)
    }
}

print("Execution time algorithms:")
let sortedResults = algorithms.sort { $0.0.executionTime < $0.1.executionTime }
var position = 1
for result in sortedResults {
    print("\(position): \(result.executionDetails)")
    position += 1
}
