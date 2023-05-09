//
//  String+Helpers.swift
//  
//
//  Created by Julian Worden on 5/8/23.
//

import Foundation

extension String {
    /// Evaluates whether or not a given String is empty after trimming any existing white spaces and new lines.
    public var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
