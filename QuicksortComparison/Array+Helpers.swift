//
//  Array+Helpers.swift
//  QuicksortComparison
//
//  Created by Prearo, Andrea on 6/10/16.
//  Copyright © 2016 Prearo, Andrea. All rights reserved.
//

import Foundation

extension Array {

    var decompose: (head: Element, tail: [Element])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }

}
