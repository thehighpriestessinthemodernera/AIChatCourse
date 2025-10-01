//
//  Date+EXT.swift
//  AIChatCourse
//
//  Created by Intuin  on 19/5/2025.
//
import Foundation

extension Date {
    func addingTime(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let secondsInDay = 86400
        let secondsInHour = 3600
        let secondsInMinute = 60

        let totalSeconds = (days * secondsInDay) + (hours * secondsInHour) + (minutes * secondsInMinute)
        return self.addingTimeInterval(TimeInterval(totalSeconds))
    }
}
