//
//  StaticsVc+collectionView.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

extension staticksVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getCollectioncellsCount()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "StaticsCollectionCell", for: indexPath) as! StaticsCollectionCell
        presenter.configurCollectionCells(cell: cell, for: indexPath.item)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionview.frame.width / 3.3 , height: collectionview.frame.height  )
    }
    
    
}
