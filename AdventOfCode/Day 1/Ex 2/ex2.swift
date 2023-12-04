//
//  ex2.swift
//  AdventOfCode
//
//  Created by Thomas Raffray on 01/12/2023.
//

import Foundation
import os

let authorizedNumberStrings: Dictionary<String, Dictionary<String, (String, String)>> = [
"o": [
    "n": ("one", "1")
    ],
"t": [
    "w": ("two", "2"),
    "h": ("three", "3")
    ],
"f": [
    "o": ("four", "4"),
    "i": ("five", "5")
    ],
"s": [
    "i": ("six", "6"),
    "e": ("seven", "7")
    ],
"e": [
    "i": ("eight", "8")
    ],
"n": [
    "i": ("nine", "9")
    ],
]

let numberStrCount: Dictionary<String, Int> = [
"1": 3,
"2": 3,
"3": 5,
"4": 4,
"5": 4,
"6": 3,
"7": 5,
"8": 5,
"9": 4,
]

private func craftCalibrationString(from line: String) -> String {
    var calibrationString = ""
    var idx = -1
    while (idx < line.count - 1) {
        idx += 1
        let firstCharIndex = line.index(line.startIndex, offsetBy: idx)
        let char = line[firstCharIndex]
        let firstLevel = String(char)
        if char.isNumber {
            calibrationString += firstLevel
            continue
        }
        
        if authorizedNumberStrings.keys.contains(where: {$0 == firstLevel}) {
            if let secondDict: Dictionary<String, (String, String)> = authorizedNumberStrings[firstLevel], idx < line.count - 1 {
                let secondLevel = String(line[line.index(line.startIndex, offsetBy: idx + 1)])
                if secondDict.keys.contains(where: {$0 == secondLevel}), let (numberStr, numberChar) = secondDict[secondLevel] {
                    guard let charCountInNumberWord = numberStrCount[numberChar] else {
                        fatalError("number word not found")
                    }

                    let endIndex = idx + charCountInNumberWord
                    if endIndex > line.count {
                        continue
                    }
                    
                    let numberWord = line[firstCharIndex..<String.Index(utf16Offset: endIndex, in: line)]
                    let isNumberWordComplete = numberWord == numberStr
                    if isNumberWordComplete {
                        calibrationString += numberChar
                    }
                    
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
