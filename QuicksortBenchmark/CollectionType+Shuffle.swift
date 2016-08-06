//
//  CollectionType+Shuffle.swift
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 7/22/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

extension CollectionType {

    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }

}

extension MutableCollectionType where Index == Int {

    mutating func shuffleInPlace() {
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            (self[i], self[j]) = (self[j], self[i])
        }
    }

}
