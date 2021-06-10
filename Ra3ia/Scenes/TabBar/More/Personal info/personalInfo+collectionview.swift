//
//  personalInfo+collectionview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/30/21.
//

import UIKit

extension PersonalInfoVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == self.typeCollectionView {
            return presenter.getNumberOfTypes()
           //return presenter.getTypesCellsCount()
        } else {
            return presenter.getSpecializationCellCount()
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.typeCollectionView {
            let cell = typeCollectionView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as! TypeCell
            presenter.configerTypeCells(cell: cell, for: indexPath.row)
        
        
        return cell

        
    }
        
        else  {
            let celll = specCollectionView.dequeueReusableCell(withReuseIdentifier: "specCell", for: indexPath) as! specCell

            presenter.ConfigerSepCell(cell: celll, for: indexPath.row)



            return celll
            
            
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.typeCollectionView {
            
            return CGSize(width: collectionView.frame.width / 3.2 , height: 30)
              
        } else {
            return CGSize(width: collectionView.frame.width / 3.4 , height: 30 )
        }
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0;
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        
        return 0.0;
    }
    
    
}
