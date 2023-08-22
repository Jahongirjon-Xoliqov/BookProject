//
//  LoadingView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 21/08/23.
//

import UIKit

class LoadingView: UIView {
    static var LOADING_VIEW_TAG = 1001
    private var loader: UIActivityIndicatorView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loader = UIActivityIndicatorView()
        addSubview(loader!)
        loader?.startAnimating()
        tag = LoadingView.LOADING_VIEW_TAG
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let center = CGPoint(x: rect.midX-17, y: rect.midY-17)
        let size = CGSize(width: 35, height: 35)
        let loaderRect = CGRect(origin: center, size: size)
        loader?.frame = loaderRect
    }
    
}
