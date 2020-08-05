//
//  CTBaseAPIViewController.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import CTNetworkingSwift

public struct Constants {
    public struct DataSource {
        public static let kTitle = "kTitle"
        public static let kClass = "kClass"
    }
}

open class CTBaseAPIViewController : UIViewController {
    lazy var tableView:UITableView = {
        let _tableView = UITableView.init(frame: .zero, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.tableFooterView = UIView()
        _tableView.register(CTBaseAPITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    open var dataSource:[[String:String]] {
        return []
    }

    public var apiManager:CTNetworkingAPIManager? = nil
    
    var selectedIndexPath:IndexPath? = nil
}
