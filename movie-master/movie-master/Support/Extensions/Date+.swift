//
//  Date+.swift
//  movie-master
//
//  Created by Furkan Torun on 24.11.2021.
//

import UIKit

extension Date {
    public var MovieFormatted: String {
        if (self == Date(timeIntervalSince1970: 0)) {
            return "Unknown!"
        }
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        return dateFormatterPrint.string(from: self)
    }
}
