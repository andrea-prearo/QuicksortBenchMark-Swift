//
//  Sorting.swift
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 6/10/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

// Functional Quicksort
func qsort1(input: [Int]) -> [Int] {
    if let (pivot, rest) = input.decompose {
        let lesser = rest.filter { $0 < pivot }
        let greater = rest.filter { $0 >= pivot }
        return qsort1(lesser) + [pivot] + qsort1(greater)
    } else {
        return []
    }
}

// In-place Quicksort
func qsort2(inout input: [Int]) {
    quickSortSub(&input, lo: 0, hi: input.count - 1)
}

func quickSortSub(inout input: [Int], lo: Int, hi: Int) -> () {
    var i = lo
    var j = hi
    let pivot = input[lo + (hi - lo) / 2]
    
    while i <= j {
        while input[i] < pivot {
            i += 1
        }
        while input[j] > pivot {
            j -= 1
        }
        
        if i <= j {
            let swap = input[i]
            input[i] = input[j]
            input[j] = swap
            
            i += 1
            j -= 1
        }
    }
    
    if lo < j {
        quickSortSub(&input, lo: lo, hi: j)
    }
    if i < hi {
        quickSortSub(&input, lo: i, hi: hi)
    }
}

// In-place with partition Quicksort
func qsort3(inout input: [Int], range: Range<Int>) {
    if (range.endIndex - range.startIndex > 1) {
        let pivotIndex = input.partition(range)
        qsort3(&input, range: range.startIndex ..< pivotIndex)
        qsort3(&input, range: pivotIndex + 1 ..< range.endIndex)
    }
}

func qsort3(inout input: [Int]) {
    qsort3(&input, range: input.indices)
}
