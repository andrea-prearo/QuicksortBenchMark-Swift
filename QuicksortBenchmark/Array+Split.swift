//
//  Array+Helpers.swift
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 6/10/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

extension Array {

    // Faster, but crashes (with an infinite loop) for ordered arrays (increasing and decreasing, step 1)
//    var decompose: (head: Element, tail: [Element])? {
//        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
//    }
    
    var decompose: (head: Element, tail: [Element])? {
        if count == 0 { return nil }
        let index = Int(arc4random_uniform(UInt32(count)))
        let array = Array(self[0..<index]) + Array(self[index+1..<count])
        return (self[index], array)
    }

}
