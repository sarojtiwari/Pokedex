//
//  File.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//

import UIKit
extension UIScrollView {

    var scrolledToTop: Bool {
        let topEdge = 0 - contentInset.top
        return contentOffset.y <= topEdge
    }

    var scrolledToBottom: Bool {
        let bottomEdge = contentSize.height + contentInset.bottom - bounds.height
        return contentOffset.y >= bottomEdge
    }

}
