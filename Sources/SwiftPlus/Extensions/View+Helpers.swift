//
//  View+Helpers.swift
//
//
//  Created by Julian Worden on 5/8/23.
//

import Foundation
import SwiftUI

extension View {
    /// Returns a given view as an AnyView object.
    ///
    /// Example use case: At the time of writing, adding multiple sheeet modifiers to a View is not possible, using this method
    /// with a sheet navigator (an object used to manage showing multiple sheets from one View) is a great way to work around this.
    /// - Returns: The given View represented as an AnyView object.
    public func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

    /// Observes the `UIApplication.willResignActiveNotification` in a cleaner, more SwiftUI-friendly way. Useful as an alternative to
    /// `@Environment(\.scenePhase)`, which does not reliably run code just before the app enters the background at the time of writing.
    ///
    /// Source: https://stackoverflow.com/questions/62840571/not-receiving-scenephase-changes
    /// - Parameter completion: The code to run just before the app enters the background.
    /// - Returns: The View to which this method call is attached.
    public func onBackground(_ completion: @escaping () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
            perform: { _ in completion() }
        )
    }

    /// Observes the `UIApplication.didBecomeActiveNotification` in a cleaner, more SwiftUI-friendly way. Useful as an alternative to
    /// `@Environment(\.scenePhase)`, which is unreliable under some conditions at the time of writing.
    ///
    /// Source: https://stackoverflow.com/questions/62840571/not-receiving-scenephase-changes
    /// - Parameter completion: The code to run just after the app enters the foreground.
    /// - Returns: The View to which this method call is attached.
    public func onForeground(_ completion: @escaping () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification),
            perform: { _ in completion() }
        )
    }

    /// Rounds specific corners of a given View.
    ///
    /// Source: https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
    /// - Parameters:
    ///   - radius: The desired radius of the rounded corners.
    ///   - corners: The corners that should be rounded.
    /// - Returns: The View to which this method call is attached.
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

/// A custom shape that makes it possible to round particular corners of a View.
///
/// Source: https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
fileprivate struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        return Path(path.cgPath)
    }
}
