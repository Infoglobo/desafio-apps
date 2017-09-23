//
//  DateParser.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation

struct DateParser {
    
    var currentDateFormat: String {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        return "\(day)/\(month)/\(year)"
    }
    
    var currentWeekDayFormat: String {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.weekday, from: date)
        return WeekDay(day: day).localized
    }
    
}

enum WeekDay: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    
    init(day: Int) {
        self = WeekDay(rawValue: day) ?? .monday
    }
    
    var localized: String {
        switch self {
        case .sunday:
            return "Domingo"
        case .monday:
            return "Segunda-feira"
        case .tuesday:
            return "Terça-feira"
        case .wednesday:
            return "Quarta-feira"
        case .thursday:
            return "Quinta-feira"
        case .friday:
            return "Sexta-feira"
        case .saturday:
            return "Sábado"
        }
    }
    
}
