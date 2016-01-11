//
//  TCDataSource.swift
//  TinyCoordinator
//
//  Created by Moch Xiao on 1/6/16.
//  Copyright © @2016 Moch Xiao (https://github.com/cuzv).
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

public class TCDataSource: NSObject//, UITableViewDataSource, UICollectionViewDataSource
{
    public let tableView: UITableView!
    public let collectionView: UICollectionView!
    
    private override init() {
        fatalError("Use init(tableView:) or init(collectionView:) instead.")
    }
    
    public init(tableView: UITableView) {
        self.tableView = tableView
        collectionView = nil
        super.init()
        checkConforms()
    }
    
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        tableView = nil
        super.init()        
        checkConforms()
    }
    
    private func checkConforms() {
        // Oops.
        // Cuz Swift does not support generic protocol, so this work can not be going on...
        if self is TCDataSourceProtocol {
        }
    }
}

/// So I try extension `TCDataSourceProtocol` implement `UITableViewDataSource`.
/// Failed agagin.
public extension TCDataSourceProtocol where Self: UITableViewDataSource {
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var reusable: UITableViewCell
        if let cell = tableView.dequeueReusableCellWithIdentifier("Cell") {
            reusable = cell
        } else {
            reusable = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        reusable.textLabel?.text = "hhhhhh"
        
        
        return reusable
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

/// Test case.
/// I guess I can not forward untill Apple do some improve...
public class DS: NSObject, TCDataSourceProtocol, UITableViewDataSource {
    
}


/// Swift does not support generic protocol, so follow code can not compile:
/// if self is TCDataSourceProtocol { ..}

//   See: http://www.captechconsulting.com/blogs/ios-9-tutorial-series-protocol-oriented-programming-with-uikit
/// > UIKit is still compiled from Objective-C, and Objective-C has no concept of protocol extendability.
///   What this means in practice is that despite our ability to declare extensions on UIKit protocols,
///   UIKit objects can't see the methods inside our extensions.
/// So we can not extension `TCDataSourceProtocol` implement `UITableViewDataSource`.
/// The only thing we can do is provide helper func for `UITableViewDataSource` implement instance.
