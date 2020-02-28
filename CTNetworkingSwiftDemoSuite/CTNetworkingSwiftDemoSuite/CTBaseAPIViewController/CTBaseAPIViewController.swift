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
    struct DataSource {
        static let kTitle = "kTitle"
        static let kClass = "kClass"
    }
}

class CTBaseAPIViewController: UIViewController {
    lazy var tableView:UITableView = {
        let _tableView = UITableView.init(frame: .zero, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.tableFooterView = UIView()
        _tableView.register(CTBaseAPITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    lazy var dataSource:[[String:String]] = {
        return []
    }()

    var apiManager:CTNetworkingAPIManager? = nil
}
