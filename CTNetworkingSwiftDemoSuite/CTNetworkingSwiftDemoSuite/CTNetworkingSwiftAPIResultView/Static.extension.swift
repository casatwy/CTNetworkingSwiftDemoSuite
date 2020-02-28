//
//  Static.extension.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

extension CTNetworkingSwiftAPIResultView {
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
        }
    }
}
