import Cocoa

let nums = [1, 2, 3, 4, 5]

// filter — solo pares
let pares = nums.filter { $0 % 2 == 0 }

// map — transformar × 3
let triples = nums.map { $0 * 3 }

// reduce — suma total
let suma = nums.reduce(0) { $0 + $1 }


