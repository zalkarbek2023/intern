//
//  Extensions+UiView.swift
//  intern-2
//
//  Created by zalkarbek on 17/8/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}

extension UICollectionViewCell {
    static var id: String {
        String(describing: self)
    }
}
