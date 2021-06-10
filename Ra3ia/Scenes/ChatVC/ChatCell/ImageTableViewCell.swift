//
//  ImageTableViewCell.swift
//  Ra3ia
//
//  Created by Sara Mady on 05/06/2021.
//

import UIKit
import MapKit
import MapKit

class ImageTableViewCell: UITableViewCell,MapCellView ,ImageChatCellView{
 
   
    @IBOutlet weak var secoundAvatat: UIImageView!
    @IBOutlet weak var Loder: UIActivityIndicatorView!
    @IBOutlet weak var MassgeImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var UserAvatar: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var markerImage: UIImageView!
    
    var artwork = Artwork(title: "", locationName: "", discipline: "", coordinate:  CLLocationCoordinate2D(latitude: 0.0, longitude:0.0))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.UserAvatar.clipsToBounds = true
        self.secoundAvatat.clipsToBounds = true
        self.MassgeImage.layer.borderWidth = 0.5
        self.MassgeImage.layer.borderColor = UIColor.BasicColor.cgColor
        self.MassgeImage.clipsToBounds = true
        
    }
    override func prepareForReuse() {
        self.UserAvatar.image = nil
        self.secoundAvatat.image = nil
      
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setImage(image: String, bool: Int) {
        if(bool == 1){
            self.UserAvatar.isHidden = false
            self.UserAvatar.setImageWith(image)
            self.secoundAvatat.isHidden = true
           
          
            self.layoutIfNeeded()
        }else{
            self.secoundAvatat.isHidden = false
            self.secoundAvatat.setImageWith(image)
            self.UserAvatar.isHidden = true
          
            self.layoutIfNeeded()
            
        }
    }
    func setUserChatImage(image: String, bool: Int) {
        if(bool == 1){
            self.UserAvatar.isHidden = false
            self.UserAvatar.setImageWith(image)
            self.secoundAvatat.isHidden = true
           
          
            self.layoutIfNeeded()
        }else{
            self.secoundAvatat.isHidden = false
            self.secoundAvatat.setImageWith(image)
            self.UserAvatar.isHidden = true
          
            self.layoutIfNeeded()
            
        }
    }
    
    func setChatImage(msg: String) {
        if(msg.contains("https")){
            self.MassgeImage.setImageWith(msg)

        }else{
            self.MassgeImage.setImageWith("https://raaia.4hoste.com/assets/uploads/chat/\(msg)")

        }
    }
    
   
    func setContent(addressObject: [String : Any]) {
        self.addressLabel.text = addressObject["addresse"] as! String
        self.getSnapShotMap(lat: addressObject["lat"] as! Double, Long: addressObject["lang"] as! Double)
    }
    
    func getSnapShotMap(lat:Double,Long:Double){
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        
        // Set the region of the map that is rendered.
        let location = CLLocationCoordinate2DMake(lat, Long) // Apple HQ
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 350, longitudinalMeters: 350)
        mapSnapshotOptions.region = region
        
        // Set the scale of the image. We'll just use the scale of the current device, which is 2x scale on Retina screens.
        mapSnapshotOptions.scale = UIScreen.main.scale
        
        // Set the size of the image output.
        mapSnapshotOptions.size = CGSize(width: 500, height: 500)
        
        // Show buildings and Points of Interest on the snapshot
        mapSnapshotOptions.showsBuildings = true
        mapSnapshotOptions.showsPointsOfInterest = true
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        snapShotter.start { (snapshot:MKMapSnapshotter.Snapshot?, errror) in
            self.MassgeImage.image = snapshot?.image
        }
    }
    
    
    
}
