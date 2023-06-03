//
//  UIView+Helpers.swift
//  
//
//  Created by Julian Worden on 6/3/23.
//

import UIKit

extension UIView {
    /// Sets `translatesAutoresizingMaskIntoConstraints` to false on a provided `UIView`, and
    /// adds a given `UIView` to the parent's view hierarchy.
    /// - Parameter view: The `UIView` that is to be added as a subview to the parent view and have its
    /// `translatesAutoresizingMaskIntoConstraints` property set to false.
    public func addConstrainedSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }

    /// Sets `translatesAutoresizingMaskIntoConstraints` to false on provided `UIView` objects, and
    /// adds these `UIView` objects to the parent's view hierarchy.
    /// - Parameter views: The `UIView` objects that are to be added as subviews to the parent view and have their
    /// `translatesAutoresizingMaskIntoConstraints` property set to false.
    public func addConstrainedSubviews(_ views: UIView...) {
        views.forEach { view in
            addConstrainedSubview(view)
        }
    }
}
