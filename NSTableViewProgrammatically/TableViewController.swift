//
//  TableViewController.swift
//  NSTableViewProgrammatically
//
//  Created by Office-iMac on 2020-09-28.
//  Copyright © 2020 Tony Jem. All rights reserved.
//
// Main initial code idea from here:
//https://gist.github.com/kitx/a80bec25661b985118a55ca33ecfdff2

import Cocoa

//let tableViewFrame = NSRect(x: 0, y: 0, width: 100, height: 500)

// MARK: - Data
let days = ["I", "II", "III"]
let hours = ["9:00 - 10:00", "11:00 - 12:00", "8:00 - 16:00"]

// MARK: -
class TableViewController: NSViewController {
    // MARK: - Properties
    let scrollView = NSScrollView()
    
    let tableView: NSTableView = {
        let tableView = NSTableView()
        
        // A table view defaults to setting the intercell spacing (the gaps between columns and rows) to (3.0, 2.0)
        // To change it should be used:
        //    tableView.intercellSpacing = NSSize(width: 0, height: 2)
        
        // Normally a table has a header view.
        // To remove it use:
        //    tableView.headerView = nil
        return tableView
    }()
    
    let column = NSTableColumn()
    let column2 = NSTableColumn()
    
    
    //    MARK: - Start here:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        column.width = 100
        //        column2.width = tableViewFrame.size.width
        column2.width = 200
        column2.title = days[2]
        
        
        // Add collumn to table:
        tableView.addTableColumn(column)
        tableView.addTableColumn(column2)
        
        
        
        // Tell the scroll view about the table view,
        // by setting the documentView to our table view:
        scrollView.documentView = tableView
    }
    
    // Loading a view controller without a NIB requires that we
    // override loadView and provide our own view instead
    override func loadView() {
        view = scrollView
    }
}


// MARK: - Extentions
extension TableViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return days.count
    }
}

extension TableViewController: NSTableViewDelegate {
    //    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
    //        return 20
    //    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        
        
        
        
        return NSTextField(labelWithString: "Cell \(row + 1)")
    }
}
