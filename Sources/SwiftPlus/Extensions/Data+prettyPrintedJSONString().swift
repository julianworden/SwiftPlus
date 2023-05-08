//
//  Data-prettyPrintedJSONString().swift
//  
//
//  Created by Julian Worden on 6/19/22.
//

import Foundation

extension Data {
    /// Converts a JSON Data object into a readable String. Useful for determining the format of data provided by an API, for example. If this method fails
    /// to convert a JSON Data object into a String, it will print an error message and return an empty String.
    /// - Returns: A readable, String representation of a given JSON Data object. If conversion fails, this value is an empty String.
    func prettyPrintedJSONString() -> String {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON Object.")
            return ""
        }

        return prettyJSONString
    }
}
