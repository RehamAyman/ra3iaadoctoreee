//
//  RegisterVC+collectionView.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import UIKit
extension RegisterVC : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.TypeCollectionView {
           return presenter.getTypesCellsCount()
            
           
        } else {
           return presenter.getSpecializationCellCount()
            
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.TypeCollectionView {
            let cell = TypeCollectionView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as! TypeCell
            presenter.configerTypeCells(cell: cell, for: indexPath.row)
            cell.selectType = {
                self.selectdTyps.append(cell.typeLabel.text!)
                self.selectedTypeId.append(cell.id)
                print("==============")
                print(self.selectdTyps)
                print(self.selectedTypeId)
                
            }
           
            
            
           return cell
            
        } else {
            
            let celll = specCollectionView.dequeueReusableCell(withReuseIdentifier: "specCell", for: indexPath) as! specCell
           presenter.configpeclizationCells(cell: celll, for: indexPath.row)
            celll.selectSpec = {
                self.selectedSpec.append(celll.specLabel.text!)
                self.selectedSpecId.append(celll.id)
                print("==============")
                print(self.selectedSpec)
                print(self.selectedSpecId)
            }
          
          
           
            return celll
            
            
        }
        
        
    }
    
    

    

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == self.TypeCollectionView {
        
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
