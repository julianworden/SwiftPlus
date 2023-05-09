//
//  CLPlacemark+formattedAddress.swift
//  
//
//  Created by Julian Worden on 5/8/23.
//

import Contacts
import CoreLocation
import Foundation

extension CLPlacemark {
    /// Converts a CLPlacemark property into a readable string representing the object's postal address. Returns nil if the given
    /// CLPlacemark does not have address information associated with it.
    public var formattedAddress: String? {
        guard let postalAddress else { return nil }

        let formatter = CNPostalAddressFormatter()
        return formatter.string(from: postalAddress)
    }
}
