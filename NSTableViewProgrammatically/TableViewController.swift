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

let tableViewFrame = NSRect(x: 0, y: 0, width: 250, height: 500)

class TableViewController: NSViewController {
  let tableView: NSTableView = {
    let tableView = NSTableView()

    // By default a tableview has column spacing. We only have
    // one column so this will the table from side scrolling
    tableView.intercellSpacing = NSSize(width: 0, height: 2)
    tableView.headerView = nil
    return tableView
  }()

  let scrollView = NSScrollView()
  let column = NSTableColumn()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
    tableView.addTableColumn(column)

    column.width = tableViewFrame.size.width

    scrollView.documentView = tableView
  }

  // Loading a view controller without a NIB requires that we
  // override loadView and provide our own view instead
  override func loadView() {
    view = scrollView
  }
}

extension TableViewController: NSTableViewDataSource {
  func numberOfRows(in tableView: NSTableView) -> Int {
    return 30
  }
}

extension TableViewController: NSTableViewDelegate {
  func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
    return 20
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    return NSTextField(labelWithString: "Cell \(row + 1)")
  }
}
//
//let vc = TableViewController(nibName: nil, bundle: nil)
//vc.view.frame = tableViewFrame
//
//PlaygroundPage.current.liveView = vc
