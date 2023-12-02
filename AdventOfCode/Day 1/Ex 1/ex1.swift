//
//  ex1.swift
//  AdventOfCode
//
//  Created by Thomas Raffray on 01/12/2023.
//

import Foundation
import os

private func craftCalibrationString(from line: String) -> String {
    line.filter{ $0.isNumber }
}

func day1ex1(with content: String) throws -> Void {

    do {
        let calibration = try computeCalibration(from: content, calibrator: craftCalibrationString)

        print(calibration)
    }

}
