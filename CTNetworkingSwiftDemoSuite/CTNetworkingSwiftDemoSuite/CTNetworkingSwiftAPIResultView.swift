//
//  CTNetworkingSwiftAPIResultView.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import SwiftHandyFrame

class CTNetworkingSwiftAPIResultView: UIView {

    // MARK: life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8)
        self.addGestureRecognizer(tapGestureRecognizer)
        
        addSubview(textView)
        addSubview(activityIndicatorView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if textView.text.count > 0 {
            activityIndicatorView.frame = .zero
            textView.hf.setSize(CGSize(width: hf.width()-20, height: hf.height()-20))
        } else {
            activityIndicatorView.hf.setSize(CGSize(width: 200, height: 200))
            textView.frame = .zero
        }
        
        activityIndicatorView.hf.setCenterEqualToView(self)
        textView.hf.setCenterEqualToView(self)
    }
    
    // MARK: static methods
    static func showInView(_ view:UIView) {
        let instanceView = CTNetworkingSwiftAPIResultView()
        instanceView.alpha = 0
        view.addSubview(instanceView)
        instanceView.hf.fill()
        instanceView.hf.setInnerTopGap(64, shouldResize: true)
        UIView.animate(withDuration: 0.3) {
            instanceView.alpha = 1
        }
    }
    
    static func config(content:String, in view:UIView) {
        for subview in view.subviews {
            guard let resultView = subview as? CTNetworkingSwiftAPIResultView else { continue }
            resultView.textView.text = content
            resultView.activityIndicatorView.stopAnimating()
            resultView.layoutSubviews()
            return
        }
    }
    

    
    // MARK: event response
    @objc func didRecognizedTapGestureRecognizer(_ gestureRecognizer:UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.alpha = 0
        }) { [weak self] (finished) in
            self?.removeFromSuperview()
        }
    }
    
    // MARK: getters and setters
    lazy var textView:UITextView = {
        let _textView = UITextView()
        _textView.textColor = .black
        _textView.backgroundColor = .white
        _textView.font = .systemFont(ofSize: 12)
        _textView.text = "";
        _textView.isEditable = false;
        return _textView
    }()
    
    lazy var activityIndicatorView:UIActivityIndicatorView = {
        let _activityIndicatorView = UIActivityIndicatorView.init()
        if #available(iOS 13.0, *) {
            _activityIndicatorView.style = .large
        } else {
            _activityIndicatorView.style = .whiteLarge
        }
        
        _activityIndicatorView.hidesWhenStopped = true
        _activityIndicatorView.color = .gray
        _activityIndicatorView.backgroundColor = .white
        _activityIndicatorView.layer.cornerRadius = 4
        _activityIndicatorView.startAnimating()
        return _activityIndicatorView
    }()
    
    lazy var tapGestureRecognizer:UITapGestureRecognizer = {
        let _tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(didRecognizedTapGestureRecognizer(_:)))
        _tapGestureRecognizer.numberOfTapsRequired = 1
        _tapGestureRecognizer.numberOfTouchesRequired = 1
        return _tapGestureRecognizer
    }()
}
