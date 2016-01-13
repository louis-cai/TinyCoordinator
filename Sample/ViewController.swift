//
//  ViewController.swift
//  Sample
//
//  Created by Moch Xiao on 1/6/16.
//  Copyright © 2016 Moch. All rights reserved.
//

import UIKit
import TinyCoordinator

class ViewController: UIViewController {
    deinit {
        debugPrint("\(__FILE__):\(__LINE__):\(self.dynamicType):\(__FUNCTION__)")
    }
    
    lazy var dataSource: DataSource = {
        DataSource(tableView: self.tableView)
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let data1: [CellDataItem] = {
//            let item1 = CellDataItem(name: "Michael Jackson", pic: "nil")
//            let item2 = CellDataItem(name: "Moch Xiao", pic: "nil")
//            let item3 = CellDataItem(name: "Kobe Bryant", pic: "nil")
//            return [item1, item2, item3, item1, item2, item3, item1, item2, item3, item1, item2, item3, item1, item2, item3]
//        }()
//
//        let data2: [CellDataItem2] = {
//            let item1 = CellDataItem2(name: "Lucy", pic: "nil")
//            let item2 = CellDataItem2(name: "Lily", pic: "nil")
//            let item3 = CellDataItem2(name: "Mike", pic: "nil")
//            let item4 = CellDataItem2(name: "Bob", pic: "nil")
//            return [item1, item2, item3, item4, item1, item2, item3, item4, item1, item2, item3, item4, item1, item2, item3, item4]
//        }()
        
        
        let data1: [CellDataItem] = {
            let item1 = CellDataItem(name: "Michael Jackson", pic: "nil")
            let item2 = CellDataItem(name: "Moch Xiao", pic: "nil")
            let item3 = CellDataItem(name: "Kobe Bryant", pic: "nil")
            return [item1, item2, item3]
        }()
        
        let data2: [CellDataItem2] = {
            let item1 = CellDataItem2(name: "Lucy", pic: "nil")
            let item2 = CellDataItem2(name: "Lily", pic: "nil")
            let item3 = CellDataItem2(name: "Mike", pic: "nil")
            let item4 = CellDataItem2(name: "Bob", pic: "nil")
            return [item1, item2, item3, item4]
        }()
        

//        let secion1 = TCSectionDataMetric(itemsData: data1)
        let secion1 = TCSectionDataMetric(itemsData: data1, titleForHeader: "Section 1 header", titleForFooter: "Section 1 footer", indexTitle: "A")
        let secion2 = TCSectionDataMetric(itemsData: data2, indexTitle: "B")
        let globalDataMetric = TCGlobalDataMetric(sectionDataMetrics: [secion1, secion2])
        
        dataSource.globalDataMetric = globalDataMetric
        tableView.dataSource = dataSource
        tableView.reloadData()
        debugPrint(globalDataMetric)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.editing = true
    }
    
}

