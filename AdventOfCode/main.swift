//
//  main.swift
//  AdventOfCode
//
//  Created by Thomas Raffray on 01/12/2023.
//

import Foundation

let day = "1"
let ex = "2"
let input = "2"

let fileName = "/Users/thomasr.affray/Documents/Private/AdventOfCode/AdventOfCode/Day \(day)/Ex \(ex)/input\(input)"

func readFile(_ name: String) throws -> String {
    let document = URL(fileURLWithPath: name)
    
    guard let content = try? String(contentsOf: document) else {
        fatalError("Unable to read the file content.")
    }
    
    return content
}

let content = try readFile(fileName)

if (day == "1") {
    if (ex == "1") {
        try day1ex1(with: content)
    }
    
    if (ex == "2") {
        try day1ex2(with: content)
    }
}
