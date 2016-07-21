//
//  main.swift
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 6/16/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

enum TestSetType: Int {
    case Random
    case StepOneIncrement
    case StepOneDecrement

    static var size: Int { return 3 }
}

typealias TestItemGenerator = (Int) -> Int

// Defaults
var testType = TestSetType.Random
var testSetSize = 10000

// Simple argument processing (just integer arguments)
if Process.arguments.count > 2 {
    if let type = Int(Process.arguments[1]),
    newValue = TestSetType(rawValue: type)
        where type < TestSetType.size {
        testType = newValue
    }
    if let size = Int(Process.arguments[2]) where size > 0 {
        testSetSize = size
    }
}

print("Dataset size: \(testSetSize)")

// Select dataset generator function
let testItem: TestItemGenerator
switch testType {
    case .Random:
        print("Using random dataset")
        testItem = { _ in return Int(arc4random()) }
        break
    case .StepOneIncrement:
        print("Using step-1 increment dataset")
        testItem = { number in return number+1 }
        break
    case .StepOneDecrement:
        print("Using step-1 decrement dataset")
        testItem = { number in return testSetSize-number }
        break
}

// Initialize test dataset
var test = [Int]()
for number in 0..<testSetSize {
    test.append(testItem(number))
}

// Define algorithms to evaluate
var sorted: [Int]? = nil
var algorithms = [SortingAlgorithmWrapper]()
algorithms.append(SortingAlgorithmWrapper(description: "sort (Foundation Quicksort)") {
    let copy = test
    sorted = copy.sort()
    return sorted!
})
algorithms.append(SortingAlgorithmWrapper(description: "in-place sort (Foundation In-Place Quicksort)") {
    var copy = test
    copy.sortInPlace()
    return copy
    })
algorithms.append(SortingAlgorithmWrapper(description: "qsort1 (Classical Quicksort)") {
    var copy = test
    qsort1(&copy)
    return copy
})
algorithms.append(SortingAlgorithmWrapper(description: "qsort2 (Quicksort with 3-way Partitioning)") {
    var copy = test
    qsort2(&copy)
    return copy
})
algorithms.append(SortingAlgorithmWrapper(description: "qsort3 (Quicksort with Hoare Partition)") {
    var copy = test
    qsort3(&copy)
    return copy
})
algorithms.append(SortingAlgorithmWrapper(description: "qsort4 (Functional Quicksort)") {
    let copy = test
    return qsort4(copy)
})
algorithms.append(SortingAlgorithmWrapper(description: "qsort5 (Quicksort with Index Range Partition)") {
    var copy = test
    qsort5(&copy)
    return copy
})

// Verify sorting results
for (index, item) in algorithms.enumerate() {
    print(algorithms[index].processingDescription)
    let result = algorithms[index].execute()
    print(algorithms[index].executionDetails)
    if let sorted = sorted {
        assert(result == sorted)
    }
}

// Print execution stats
if algorithms.count > 1 {
    print("Algorithm execution time ranking:")
    let sortedResults = algorithms.sort { $0.0.executionTime < $0.1.executionTime }
    var position = 1
    for result in sortedResults {
        print("\(position): \(result.executionDetails)")
        position += 1
    }
}
