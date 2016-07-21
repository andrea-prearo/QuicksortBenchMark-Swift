#!/usr/bin/env swift

import Foundation

let path = "~/Library/Developer/Xcode/DerivedData/QuicksortComparison-cftkbozmgcnhcvccwhvrsqsctewv/Build/Products/Debug/" + "QuicksortComparison"

func shell(args: String...) -> Int32 {
    let task = NSTask()
    task.launchPath = path
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

let sizes = [10000, 100000, 1000000]
let types = [0, 1, 2]

sizes.map { size in
    types.map { type in
    	shell(String(type), String(size))
    }
}
