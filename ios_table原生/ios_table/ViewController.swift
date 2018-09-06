//
//  ViewController.swift
//  ios_table
//
//  Created by darren on 2018/9/6.
//  Copyright © 2018年 陈亮陈亮. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var bottomView: UIScrollView = {
        let content = UIScrollView.init(frame: CGRect.zero)
        return content
    }()
    
    lazy var leftTableView: UITableView = {
        let tab = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
        tab.delegate = self
        tab.dataSource = self
        tab.rowHeight = 44
        tab.separatorStyle = .none
        return tab
    }()
    lazy var topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout:layout)
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = CGSize(width: 0, height: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(TopCell.self, forCellWithReuseIdentifier: "TopCell")
        return collectionView
    }()
    
    var identify = "collectionID"
    lazy var rightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout:layout)
        layout.headerReferenceSize = CGSize(width: 0, height: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib.init(nibName: "TableItemCell", bundle: nil), forCellWithReuseIdentifier: self.identify)
        return collectionView
    }()
    lazy var leftHeader: UIView = {
        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 44))
        return header
    }()
    lazy var headerTitle: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textAlignment = .center
        label.text = "集团名称"
        return label
    }()
    lazy var headerLine: UIView = {
        let line = UIView.init(frame: CGRect.zero)
        line.backgroundColor = UIColor.groupTableViewBackground
        return line
    }()

    var leftTableData: [String] = []
    var topData: [String] = []
    var rightCollectionData: [[String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initLayout()
        
        loadData()
    }
    
    func initView() {
        self.view.addSubview(self.bottomView)
        self.bottomView.addSubview(self.leftTableView)
        self.bottomView.addSubview(self.topCollectionView)
        self.bottomView.addSubview(self.rightCollectionView)
        
        self.leftTableView.tableHeaderView = self.leftHeader
        
        self.bottomView.backgroundColor = UIColor.groupTableViewBackground
        self.bottomView.bounces = false
        self.bottomView.contentInsetAdjustmentBehavior = .never
        
        self.leftTableView.backgroundColor = UIColor.white
        self.leftTableView.isScrollEnabled = false
        self.leftTableView.isUserInteractionEnabled = false
        
        self.topCollectionView.backgroundColor = UIColor.white
        self.rightCollectionView.backgroundColor = UIColor.white
        
        self.leftHeader.addSubview(self.headerTitle)
        self.leftHeader.addSubview(self.headerLine)
    }
    
    func initLayout() {
        self.bottomView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
        self.leftTableView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(1)
            make.top.equalToSuperview().offset(1)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(0)
            make.bottom.equalToSuperview()
        }
        self.topCollectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.leftTableView.snp.trailing).offset(1)
            make.top.equalTo(self.leftTableView.snp.top)
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalToSuperview().multipliedBy(0.7).offset(-2)
        }
        self.rightCollectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.topCollectionView.snp.leading)
            make.top.equalTo(self.topCollectionView.snp.bottom)
            make.trailing.equalTo(self.topCollectionView.snp.trailing)
            make.width.equalTo(self.topCollectionView.snp.width)
            make.height.equalTo(self.leftTableView.snp.height).offset(0)
        }

        self.leftHeader.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.width.equalTo(self.leftTableView.snp.width)
            make.top.equalToSuperview()
            make.height.equalTo(44)
        }
        self.headerTitle.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.headerLine.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.trailing.equalToSuperview()
        }
    }
    
    func loadData() {
        let total = 30
        for i in 0..<total {
            let title = "集团名称\(i)"
            self.leftTableData.append(title)
            
            let title2 = "销售额(万元)\(i)"
            self.topData.append(title2)
            
            
            var arr: [String] = []
            for j in 0..<total {
                let title = "\(i)金额\(j)万元"
                arr.append(title)
            }
            self.rightCollectionData.append(arr)
        }
        self.leftTableView.reloadData()
        self.topCollectionView.reloadData()
        self.rightCollectionView.reloadData()
        
        // 更新底部的contentsize
        self.leftTableView.snp.updateConstraints { (make) in
            make.height.equalTo(44 * (total + 1))
        }
        self.rightCollectionView.snp.updateConstraints { (make) in
            make.height.equalTo(self.leftTableView.snp.height).offset(-45)
        }
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LeftCell.cellWithTableView(tableView: tableView)
        cell.titleLabel.text = self.leftTableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topCollectionView {
            return self.topData.count
        }
        return self.rightCollectionData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.topCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
            cell.titleLable.text = self.topData[indexPath.row]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identify, for: indexPath) as! TableItemCell
        cell.dataArr = self.rightCollectionData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topCollectionView {
            return CGSize.init(width: 90, height: 44)
        } else {
            return CGSize.init(width: 90, height: self.rightCollectionView.frame.height-1)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.rightCollectionView {
            self.topCollectionView.setContentOffset(scrollView.contentOffset, animated: false)
        }
        if scrollView == self.topCollectionView {
            self.rightCollectionView.setContentOffset(scrollView.contentOffset, animated: false)
        }
    }
}
