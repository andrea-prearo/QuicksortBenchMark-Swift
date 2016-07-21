//
//  Sorting.swift
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 6/10/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

func qsort1(inout input: [Int]) {
    input.shuffleInPlace()
    quickSortSub1(&input, lo: 0, hi: input.count - 1)
}

// Classical Quicksort (Sedgewick - pag. 289)
func quickSortSub1(inout input: [Int], lo: Int, hi: Int) {
    if (hi <= lo) { return }
    let j = partition1(&input, lo: lo, hi: hi)
    quickSortSub1(&input, lo: lo, hi: j - 1)
    quickSortSub1(&input, lo: j + 1, hi: hi)
}

// Classical Quicksort partitioning (Sedgewick - pag. 291)
func partition1(inout input: [Int], lo: Int, hi: Int) -> Int {
    var i = lo + 1
    var j = hi
    let pivot = input[lo]
    
    while true {
        while input[i] < pivot {
            if i == hi { break }
            i = i + 1
        }
        while pivot < input[j] {
            if j == lo { break }
            j = j - 1
        }
        if i >= j { break }
        (input[i], input[j]) = (input[j], input[i])
    }
    (input[lo], input[j]) = (input[j], input[lo])
    return j;
}

func qsort2(inout input: [Int]) {
    input.shuffleInPlace()
    quickSortSub2(&input, lo: 0, hi: input.count - 1)
}

// Sedgewick - pag. 299 (3-way partitioning)
func quickSortSub2(inout input: [Int], lo: Int, hi: Int) {
    if hi <= lo { return }
    var lt = lo
    var i = lo + 1
    var gt = hi
    let pivot = input[lo]
    
    while i <= gt {
        if input[i] < pivot {
            (input[lt], input[i]) = (input[i], input[lt])
            lt = lt + 1
            i = i + 1
        } else if input[i] > pivot {
            (input[i], input[gt]) = (input[gt], input[i])
            gt = gt - 1
        } else {
            i = i + 1
        }
    }
    quickSortSub2(&input, lo: lo, hi: lt - 1);
    quickSortSub2(&input, lo: gt + 1, hi: hi);
}

func qsort3(inout input: [Int]) {
    input.shuffleInPlace()
    quickSortSub3(&input, lo: 0, hi: input.count - 1)
}

// Quicksort with Hoare partition
func quickSortSub3(inout input: [Int], lo: Int, hi: Int) -> () {
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
            (input[i], input[j]) = (input[j], input[i])
            i += 1
            j -= 1
        }
    }
    
    if lo < j {
        quickSortSub3(&input, lo: lo, hi: j)
    }
    if i < hi {
        quickSortSub3(&input, lo: i, hi: hi)
    }
}

// Functional Quicksort
func qsort4(input: [Int]) -> [Int] {
    if let (pivot, rest) = input.decompose {
        let lesser = rest.filter { $0 < pivot }
        let greater = rest.filter { $0 >= pivot }
        return qsort4(lesser) + [pivot] + qsort4(greater)
    } else {
        return []
    }
}

func qsort5(inout input: [Int]) {
    input.shuffleInPlace()
    qsort5(&input, range: input.indices)
}

// Quicksort with index range partition
func qsort5(inout input: [Int], range: Range<Int>) {
    if (range.endIndex - range.startIndex > 1) {
        let pivotIndex = input.partition(range)
        qsort5(&input, range: range.startIndex ..< pivotIndex)
        qsort5(&input, range: pivotIndex + 1 ..< range.endIndex)
    }
}
