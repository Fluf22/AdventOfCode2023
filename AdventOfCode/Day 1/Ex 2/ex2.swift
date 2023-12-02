//
//  ex2.swift
//  AdventOfCode
//
//  Created by Thomas Raffray on 01/12/2023.
//

import Foundation
import os

let authorizedNumberStrings: Dictionary<String, Dictionary<String, String>> = [
"o": [
    "n": "1"
    ],
"t": [
    "w": "2",
    "h": "3"
    ],
"f": [
    "o": "4",
    "i": "5"
    ],
"s": [
    "i": "6",
    "e": "7"
    ],
"e": [
    "i": "8"
    ],
"n": [
    "i": "9"
    ],
]

let numberStrCount: Dictionary<String, Int> = [
"1": 2,
"2": 2,
"3": 4,
"4": 3,
"5": 3,
"6": 2,
"7": 4,
"8": 4,
"9": 3,
]

private func craftCalibrationString2(from line: String) -> String {
    var calibrationString = ""
    var idx = -1
    while (idx < line.count - 1) {
        idx += 1
        let char = line[line.index(line.startIndex, offsetBy: idx)]
        let firstLevel = String(char)
        if char.isNumber {
            calibrationString += firstLevel
            continue
        }
        
        if authorizedNumberStrings.keys.contains(where: {$0 == firstLevel}) {
            if let secondDict: Dictionary<String, String> = authorizedNumberStrings[firstLevel], idx < line.count - 1 {
                let secondLevel = String(line[line.index(line.startIndex, offsetBy: idx + 1)])
                if secondDict.keys.contains(where: {$0 == secondLevel}), let numberChar = secondDict[secondLevel] {
                    calibrationString += numberChar
                    idx += numberStrCount[numberChar]!
                    continue
                }
            }
        }
        
        continue
    }
    
    return calibrationString
}

private func craftCalibrationString(from line: String) -> String {
    var calibrationString = ""
    for (idx, char) in line.enumerated() {
        let firstLevel = String(char)
        if char.isNumber {
            calibrationString += firstLevel
            continue
        }
        
        if authorizedNumberStrings.keys.contains(where: {$0 == firstLevel}) {
            if let secondDict: Dictionary<String, String> = authorizedNumberStrings[firstLevel], idx < line.count - 1 {
                let secondLevel = String(line[line.index(line.startIndex, offsetBy: idx + 1)])
                if secondDict.keys.contains(where: {$0 == secondLevel}), let numberChar = secondDict[secondLevel] {
                    calibrationString += numberChar
                    continue
                }
            }
        }
        
        continue
    }
    
    return calibrationString
}

func day1ex2(with content: String) throws -> Void {

    do {
        let calibration = try computeCalibration(from: content, calibrator: craftCalibrationString)

        print(calibration)
    }

}
