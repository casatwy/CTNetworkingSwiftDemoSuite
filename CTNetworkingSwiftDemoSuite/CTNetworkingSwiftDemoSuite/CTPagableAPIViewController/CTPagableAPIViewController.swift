//
//  CTPagableAPIViewController.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import CTNetworkingSwift

class CTPagableAPIViewController: UIViewController {
    lazy var statusLabel:UILabel = {
        let _statusLabel = UILabel.init()
        _statusLabel.text = "..."
        _statusLabel.textColor = .blue
        _statusLabel.textAlignment = .center
        return _statusLabel
    }()
    
    lazy var loadNextPageButton:UIButton = {
        let _loadNextPageButton = UIButton.init()
        _loadNextPageButton.addTarget(self, action: #selector(didTappedLoadNextPageButton), for: .touchUpInside)
        _loadNextPageButton.setTitle("Next Page", for: .normal)
        _loadNextPageButton.setTitleColor(.blue, for: .normal)
        _loadNextPageButton.setTitleColor(.darkGray, for: .highlighted)
        return _loadNextPageButton
    }()
    
    lazy var loadFirstPageButton:UIButton = {
        let _loadFirstPageButton = UIButton.init()
        _loadFirstPageButton.addTarget(self, action: #selector(didTappedLoadFirstPageButton), for: .touchUpInside)
        _loadFirstPageButton.setTitle("First Page", for: .normal)
        _loadFirstPageButton.setTitleColor(.blue, for: .normal)
        _loadFirstPageButton.setTitleColor(.darkGray, for: .highlighted)
        return _loadFirstPageButton
    }()
    
    var apiManager:CTNetworkingAPIManagerPagable? = nil
}
