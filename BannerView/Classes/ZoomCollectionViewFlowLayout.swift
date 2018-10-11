//
//  ZoomCollectionViewFlowLayout.swift
//  BannerView
//
//  Created by jamalping on 2018/9/28.
//

import Foundation

// MARK: 缩放布局
class ZoomCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // 先复制一份
        guard let copyAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        guard let collectionV = self.collectionView else {
            return nil
        }
        //屏幕中线
        let centerX: CGFloat = collectionV.contentOffset.x + collectionV.bounds.size.width/2.0
        //刷新cell缩放
        for attribute in copyAttributes {
            let distance = fabs(attribute.center.x - centerX)
            // 移动的距离和屏幕宽度的比例
            let apartScale = distance/collectionV.bounds.width
            //把卡片移动范围固定到 -π/4到 +π/4这一个范围内
            let scale = fabs(cos(apartScale * CGFloat.pi/4))
            //设置cell的缩放 按照余弦函数曲线 越居中越趋近于1
            attribute.transform = CGAffineTransform.init(scaleX: 1.0, y: scale)
        }
        return copyAttributes
    }
    
    //是否需要重新计算布局
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
