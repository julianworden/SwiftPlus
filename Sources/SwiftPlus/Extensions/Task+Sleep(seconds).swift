//
//  File.swift
//  
//
//  Created by Julian Worden on 5/8/23.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    /// A cleaner way of writing `Task.sleep(until: .now + .seconds(x), clock: .continuous)`.
    ///
    /// Source: https://stackoverflow.com/questions/68715266/how-to-await-x-seconds-with-async-await-swift-5-5
    /// - Parameter seconds: The amount of seconds to wait before executing any code
    /// that comes after this method is called
    public static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
