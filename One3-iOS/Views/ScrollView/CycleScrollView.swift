//
//  CycleScrollView.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/30.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit

let cycleCollectionViewCellIdentifier = "CycleCollectionViewCellIdentifier"

protocol CycleScrollViewDelegate: NSObjectProtocol {
    func cycleScrollView(_ cycleScrollView: CycleScrollView, didSelectItemAt index: UInt)
    func cycleScrollView(_ cycleScrollView: CycleScrollView, didScrollTo index: UInt)
}

class CycleScrollView: UIView {

    // COMMENT: - Data Source Property
    
    var localImageNamesGroup: [String] = []
    var imageURLStringsGroup: [String] = []
    var titlesGroup: [String] = []
    
    // COMMENT: - Scroll Controll Property
    
    var autoScrollTimeInterval: CGFloat = 2.0
    var isInfinite: Bool = true
    var isAutoScroll: Bool = true
    var delegate: CycleScrollViewDelegate?
    
    // COMMENT: - Custom Appearence Property
    // TODO:

    // MARK: - Implementation
    
    var totalCountOfItems: Int = 0
    
    var mainView: UICollectionView!
    var flowLayout: UICollectionViewFlowLayout!
    
    var pageControl: UIPageControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.mainView.frame = self.bounds
        self.flowLayout?.itemSize = self.frame.size
        
        self.pageControl.center = self.center
    }
    
    // MARK: Setup UI
    
    func setupSubviews() {
        setupMainView()
        setupPageControl()
    }
    
    func setupMainView() {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CycleCollectionViewCell.self, forCellWithReuseIdentifier: cycleCollectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        mainView = collectionView
        
        addSubview(mainView)
    }
    
    func setupPageControl() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.isUserInteractionEnabled = false
        
        addSubview(pageControl)
    }
}

// MARK: - Collection View Data Source

extension CycleScrollView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleCollectionViewCellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.random
        return cell
    }
}

// MARK: - Collection View Delegate

extension CycleScrollView: UICollectionViewDelegate {
    
}

// MARK: - Scroll View Delegate

extension CycleScrollView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int((scrollView.contentOffset.x + mainView.bounds.width * 0.5) / mainView.bounds.width)
        pageControl.currentPage = index
    }
}
