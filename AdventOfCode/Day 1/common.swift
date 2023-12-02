//
//  common.swift
//  AdventOfCode
//
//  Created by Thomas Raffray on 01/12/2023.
//

import Foundation

func retrieveCalibration(from line: String, calibrator: (String) -> String) throws -> Int {
    let calibrationString = calibrator(line)
    
    guard let firstLetter = calibrationString.first else {
        fatalError("Unable to find first letter")
    }
    
    guard let lastLetter = calibrationString.last else {
        fatalError("Unable to find last letter")
    }

    guard let calibration = Int(String(firstLetter) + String(lastLetter)) else {
        fatalError("Unable to get calibration.")
    }
    
    return calibration
}

func computeCalibration(from calibrationDoc: String, calibrator: (String) -> String) throws -> Int {
    try calibrationDoc
        .components(separatedBy: "\n")
        .filter{!$0.isEmpty}
        .map{try retrieveCalibration(from: String($0), calibrator: calibrator)}
        .reduce(0, +)
}
