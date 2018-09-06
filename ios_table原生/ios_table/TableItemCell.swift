//
//  TableItemCell.swift
//  ios_table
//
//  Created by darren on 2018/9/6.
//  Copyright © 2018年 陈亮陈亮. All rights reserved.
//

import UIKit

class TableItemCell: UICollectionViewCell {

    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 44
        self.tableView.tableFooterView = UIView()
        self.tableView.isScrollEnabled = false
    }
    
    var dataArr: [String]? {
        didSet {
            self.tableView.reloadData()
        }
    }

}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension TableItemCell: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LeftCell.cellWithTableView(tableView: tableView)
        cell.titleLabel.text = self.dataArr?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


