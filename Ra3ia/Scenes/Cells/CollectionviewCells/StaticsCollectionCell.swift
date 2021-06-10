//
//  StaticsCollectionCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class StaticsCollectionCell: UICollectionViewCell , StaticsCollectionCellView {
   
    
    
    //MARK:-OUTLETS
    
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var mainNum: UILabel!
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var staticImage: UIImageView!
    //MARK:-  CYCLE
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.addRoundedshadwo()
        
    }
    
    //MARK:- CELL PROTOCOLS
    func setStaticImage(image: String) {
        self.staticImage.image = UIImage(named: image)
       }
       
       func setMainNum(num: String) {
        self.mainNum.text = num
       }
       
       func setDetails(details: String) {
        self.details.text = details
       }
   
    
}
