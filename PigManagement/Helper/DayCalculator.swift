//
//  DayCalculator.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 25/02/2021.
//

import UIKit

extension Date {

    var weekOfYear: Int {
        return Calendar.current.ordinality(of: .weekOfYear, in: .year, for: self) ?? 0

    }

    func isLeapYear(_ date: Date) -> Bool {
        let component = Calendar.current.dateComponents([.year], from: date)
        let year = component.year!
        let isLeapYear = ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
        return isLeapYear
    }

    func calculateTotalWeekAndCreateBatches(_ date: Date) -> [Int] {
        let component = Calendar.current.range(of: .weekOfYear, in: .year, for: date)
        let intArray: [Int] = Array(component!)
        return intArray
        }
    }
