//
//  File.swift
//  
//
//  Created by Julian Worden on 5/8/23.
//

import Foundation

extension Date {
    /// A cleaner way of calling Date.now.formatted(date: .numeric, time: .omitted). Returns a date String
    /// with the following format:  10/17/2020.
    public var timeOmittedNumericDateString: String {
        self.formatted(date: .numeric, time: .omitted)
    }

    /// A cleaner way of calling Date.now.formatted(date: .omitted, time: .shortened). Returns a time String
    /// with the following format:  9:54 PM.
    public var timeShortenedDateOmittedString: String {
        self.formatted(date: .omitted, time: .shortened)
    }
}


