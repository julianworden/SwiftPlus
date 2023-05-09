//
//  File.swift
//  
//
//  Created by Julian Worden on 5/8/23.
//

import Foundation

extension Double {
    /// Converts a given Unix date to a Date object.
    public var unixDateAsDate: Date {
        Date(timeIntervalSince1970: self)
    }
}
