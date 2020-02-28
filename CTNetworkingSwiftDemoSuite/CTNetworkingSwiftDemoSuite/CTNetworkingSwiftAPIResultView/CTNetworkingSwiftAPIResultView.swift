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
        let _activityIndicatorView = UIActivityIndicatorView()
        
    }()
    
}
