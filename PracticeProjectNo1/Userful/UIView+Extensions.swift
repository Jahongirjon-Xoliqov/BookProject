//
//  UIView+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 21/08/23.
//

import UIKit

extension UIView {
    func startLoading() {
        let loadingView = LoadingView(frame: bounds)
        addSubview(loadingView)
    }
    func endLoading() {
        subviews.forEach {
            if $0.tag == LoadingView.LOADING_VIEW_TAG {
                $0.destroy()
            }
        }
    }
    func destroy() {
        UIView.animate(withDuration: 0.4) {
            self.alpha = 0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
}
