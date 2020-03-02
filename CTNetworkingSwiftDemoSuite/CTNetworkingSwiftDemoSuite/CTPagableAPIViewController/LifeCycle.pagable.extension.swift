//
//  LifeCycle.extension.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import Foundation
import SwiftHandyFrame

extension CTPagableAPIViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(statusLabel)
        view.addSubview(loadFirstPageButton)
        view.addSubview(loadNextPageButton)
        
        apiManager?.delegate = self
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loadFirstPageButton.sizeToFit()
        loadFirstPageButton.hf.setCenterEqualToView(view)
        
        statusLabel.sizeToFit()
        statusLabel.hf.fillWidth()
        statusLabel.hf.setBottomGap(50, fromView: loadFirstPageButton)
        
        loadNextPageButton.sizeToFit()
        loadNextPageButton.hf.setCenterXEqualToView(view)
        loadNextPageButton.hf.setTopGap(50, fromView: loadFirstPageButton)
    }
}
