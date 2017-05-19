//
//  SearchViewController.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/31.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit
import SnapKit

enum SearchType: Int {
    case home
    case read
    case music
    case movie
    case author
    
    static let items: [String] = ["插图", "阅读", "音乐", "影视", "作者/音乐人"]
    
    var title: String {
        return SearchType.items[self.rawValue]
    }
    
    var cellIdentifier: String {
        switch self {
        case .home:
            return ResultCellIdentifier.SearchPictureCellIdentifier.rawValue
        case .read:
            return ResultCellIdentifier.SearchReadCellIdentifier.rawValue
        case .music:
            return ResultCellIdentifier.SearchMusicCellIdentifier.rawValue
        case .movie:
            return ResultCellIdentifier.SearchMovieCellIdentifier.rawValue
        case .author:
            return ResultCellIdentifier.SearchAuthorCellIdentifier.rawValue
        }
    }
}

enum ResultCellIdentifier: String {
    case SearchPictureCellIdentifier
    case SearchReadCellIdentifier
    case SearchMusicCellIdentifier
    case SearchMovieCellIdentifier
    case SearchAuthorCellIdentifier
}

class SearchViewController: UIViewController {
    
    lazy var searchBar = UISearchBar()
    lazy var hintView = UIImageView(image: #imageLiteral(resourceName: "search_all"))
    lazy var segmentedControl = UISegmentedControl(items: SearchType.items)
    lazy var tableView: UITableView = UITableView(frame: self.view.bounds)
    lazy var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    var searchType: SearchType = .home
    var dataSource: [String: Any] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchBar.becomeFirstResponder()
    }
    
    func setupSubviews() {
        setupSearchBar()
        setupHintView()
        setupSegmentedControl()
        setupTableView()
        setupActivityIndicatorView()
    }
    
    func setupSearchBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchViewController.cancelAction))
        
        searchBar.placeholder = "输入搜索内容"
        searchBar.tintColor = UIColor.navigationBarTintColor
        searchBar.returnKeyType = .search
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func setupHintView() {
        hintView.backgroundColor = UIColor.white
        view.addSubview(hintView)
        hintView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 165, height: 110))
            make.top.equalTo(view).offset(114)
            make.centerX.equalTo(view)
        }
    }
    
    func setupSegmentedControl() {
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = UIColor.navigationBarTintColor
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(SearchViewController.selectedSegment(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(25)
            make.left.top.right.equalTo(view).inset(UIEdgeInsetsMake(64, 0, 0, 0))
        }
        segmentedControl.isHidden = true
    }
    
    func setupTableView() {
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchPictureCell.self, forCellReuseIdentifier: ResultCellIdentifier.SearchPictureCellIdentifier.rawValue)
        tableView.register(SearchReadCell.self, forCellReuseIdentifier: ResultCellIdentifier.SearchReadCellIdentifier.rawValue)
        tableView.register(SearchMusicCell.self, forCellReuseIdentifier: ResultCellIdentifier.SearchMusicCellIdentifier.rawValue)
        tableView.register(SearchMovieCell.self, forCellReuseIdentifier: ResultCellIdentifier.SearchMovieCellIdentifier.rawValue)
        tableView.register(SearchAuthorCell.self, forCellReuseIdentifier: ResultCellIdentifier.SearchAuthorCellIdentifier.rawValue)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(2)
            make.left.bottom.right.equalTo(view)
        }
        tableView.isHidden = true
    }
    
    func setupActivityIndicatorView() {
        activityIndicatorView.hidesWhenStopped = true
        view.addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
    }
    
    // MARK: Actions
    
    func cancelAction() {
        searchBar.resignFirstResponder()
        dismiss(animated: true)
    }
    
    func selectedSegment(_ sender: UISegmentedControl) {
        searchType = SearchType(rawValue: sender.selectedSegmentIndex)!
        print(searchType.title)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchType.cellIdentifier)
        cell?.textLabel?.text = String.random(ofLength: 8)
        return cell!
    }
}

extension SearchViewController: UITableViewDelegate {
    
}
