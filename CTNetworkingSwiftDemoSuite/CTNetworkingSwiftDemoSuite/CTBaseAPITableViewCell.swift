//
//  CTBaseAPITableViewCell.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import SwiftHandyFrame

public class CTBaseAPITableViewCell: UITableViewCell {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        guard let textLabel = textLabel else { return }
        guard let detailTextLabel = detailTextLabel else { return }
        
        textLabel.hf.setInnerTopGap(5, shouldResize: false)
        
        detailTextLabel.sizeToFit()
        detailTextLabel.hf.leftEqualToView(textLabel)
        detailTextLabel.hf.setInnerBottomGap(5, shouldResize: false)
    }
    
    func config(title:String, detail:String) {
        textLabel?.text = title
        detailTextLabel?.text = detail
        layoutSubviews()
    }
    
}
