//
//  BannerView.swift
//  BannerView
//
//  Created by jamalping on 2018/9/28.
//

import UIKit


public class BannerView: UIView {
    
    var collectionView: UICollectionView?
    var m_currentIndex: Int?
    var m_dragStartX: CGFloat = 0
    var m_dragEndX: CGFloat = 0
    
    var datas:[String] = []

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createUI()
        self.loadDatas()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDatas() {
        let data = ["img1","img2","img3","img4"]
        for _ in 0..<4 {
            self.datas.append(contentsOf: data)
        }
        
        self.collectionView?.reloadData()
        self.collectionView?.layoutIfNeeded()
        self.collectionView?.scrollToItem(at: IndexPath.init(item: self.datas.count/2, section: 0), at: .centeredHorizontally, animated: false)
        self.m_currentIndex = self.datas.count/2
    }
    func createUI() {
        let layout = ZoomCollectionViewFlowLayout.init()

        layout.itemSize = CGSize.init(width: 474.0*kJLXWidthScale, height: 848.0*kJLXHeightScale)

        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 50.0*kJLXWidthScale;
        layout.minimumInteritemSpacing = 50.0*kJLXWidthScale;
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: self.bounds.size.width/2.0-474*kJLXWidthScale/2, bottom: 0, right: self.bounds.size.width/2.0-474*kJLXWidthScale/2)

        self.collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)

        self.collectionView!.backgroundColor = kJLXBackgroundColor

        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView!.isPagingEnabled = false
        self.collectionView!.showsHorizontalScrollIndicator = false
        self.addSubview(self.collectionView!)

        self.collectionView?.register(UICollectionCell.classForCoder(), forCellWithReuseIdentifier: UICollectionCell.reuseIdentifier)

        self.collectionView?.frame = CGRect.init(x: 0, y: 40*kJLXHeightScale, width: JLXScreenSize.width, height: JLXScreenSize.height)

        self.collectionView!.contentSize =
            CGSize.init(width: CGFloat(self.datas.count)*JLXScreenSize.width, height: 0)
    }

    func fixCellToCenter() {
        // 滚动最小距离
        let dragMiniDistance = self.bounds.size.width/20.0
        
        let startX = self.m_dragStartX
        
        let endX = self.m_dragEndX
        
        if startX - endX >= dragMiniDistance { // 向右
            self.m_currentIndex = self.m_currentIndex! - 1
        }else if endX - startX > dragMiniDistance { // 向左
            self.m_currentIndex = self.m_currentIndex! + 1
        }
        let maxIndex = (self.collectionView?.numberOfItems(inSection: 0))! - 1
        self.m_currentIndex = self.m_currentIndex! <= 0 ? 0 : self.m_currentIndex
        self.m_currentIndex = self.m_currentIndex! >= maxIndex ? maxIndex : self.m_currentIndex
        self.collectionView?.scrollToItem(at: IndexPath.init(item: self.m_currentIndex!, section: 0), at: .centeredHorizontally, animated: true)
    }
}


// MARK: collectionView delegate
extension BannerView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionCell.reuseIdentifier, for: indexPath) as! UICollectionCell

        let imageName = self.datas[indexPath.item]
        
        cell.textLabel.text = String.init(indexPath.item)
        
        cell.coverImgView?.image = UIImage.init(named: imageName, in: Bundle.init(for: self.classForCoder), compatibleWith: nil)

        return cell
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.m_currentIndex = indexPath.item
        self.fixCellToCenter()
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.m_dragStartX = scrollView.contentOffset.x
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.m_dragEndX = scrollView.contentOffset.x
        DispatchQueue.main.async {
            self.fixCellToCenter()
        }
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if self.m_currentIndex == self.datas.count/4*3 { // 最后一条}

            let path = IndexPath.init(item: self.datas.count/2, section: 0)

            self.collectionView?.scrollToItem(at: path, at: .centeredHorizontally, animated: false)

            self.m_currentIndex = self.datas.count/2

        }
        else if self.m_currentIndex == self.datas.count/4 { // 第一条

            let path = IndexPath.init(item: self.datas.count/2, section: 0)

            self.collectionView!.scrollToItem(at: path, at: .centeredHorizontally, animated: false)
            self.m_currentIndex = self.datas.count/2
        }
    }
}
