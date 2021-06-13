//
//  SelectLocationViewController.swift
//  Ra3ia
//
//  Created by Sara Mady on 20/04/2021.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import MapKit


protocol sendDataBackDelegate {
    func finishPassing(location: String , lat:Double , lng:Double)
}

class SelectLocationViewController: UIViewController ,CLLocationManagerDelegate,UIGestureRecognizerDelegate , GMSMapViewDelegate{
    @IBOutlet weak var confirmationBtn: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var googleMap: GMSMapView!
    @IBOutlet var titleLable: UILabel!
    
    let googleKey = defaults.string(forKey: "AIzaSyBrEyBXL7xP6XwzTnybqmYciGjjxsYF5xI")
    let locationManager = CLLocationManager()
    var matchingItems: [MKMapItem] = [MKMapItem]()
    var delegate: sendDataBackDelegate?
    let Storeannotation = ImageAnnotation()
    let userAnnotaion = ImageAnnotation()
    var lat:Double?
    var lng:Double?
    var marker = GMSMarker()
    var titleView = ""
    var isRecive = ""
    
  
    override func viewDidLoad() {
        requestLocationAccess()
        locationManager.delegate = self
               locationManager.requestWhenInUseAuthorization()
               locationManager.requestLocation()
        setMapview()
    }
    
    
    
    
    func setMapview() {
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        googleMap.delegate = self
        self.locationLabel.isUserInteractionEnabled = true
        let imageView = UIImageView(image: #imageLiteral(resourceName: "locaa"))
        imageView.center = self.view.center
        self.googleMap?.addSubview(imageView)
        self.googleMap.settings.myLocationButton = true
        googleMap.isMyLocationEnabled = true
      

        self.locationLabel.text = "Your Location".localized
        self.confirmationBtn.setTitle("Confirmation".localized, for: .normal)
        
        
    }
    
    
    
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func makeButtonSelected(btn:UIButton){
        btn.backgroundColor = UIColor.BasicColor
        btn.setTitleColor(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1), for: .normal)
    }
    
    func makeButtonUnSelected(btn:UIButton){
        btn.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        btn.setTitleColor(UIColor.BasicColor, for: .normal)
        
    }
    
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        self.lat = mapView.camera.target.latitude
        self.lng = mapView.camera.target.longitude
        let position = CLLocationCoordinate2DMake(self.lat!, self.lng!)
        marker.position = position
        print("geeetAdddress")
        getAddress(lat:self.lat! , Lng: self.lng!)
    }
    
    
    
    func getAddress(lat: Double , Lng: Double){
        
        var formatted_address: String!
        API.GET(url: "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + "\(lat),\(Lng)&key=\(defaults.string(forKey: "AIzaSyBrEyBXL7xP6XwzTnybqmYciGjjxsYF5xI") ?? "AIzaSyBrEyBXL7xP6XwzTnybqmYciGjjxsYF5xI")&language=\(AppLanguage.getLang())") { (success, result) in
            if success {
                let dict = result
                if let status = dict["status"] as? String {
                    if status == "OK" {
                        if let results = dict["results"] as? [[String:AnyObject]] {
                            let resultAddress = results[0]
                            let fullAddress = resultAddress["formatted_address"] as! String
                            formatted_address = fullAddress.replacingOccurrences(of: ",", with: " ").replacingOccurrences(of: "-", with: " ")
                            print("Address:" + formatted_address)
                            self.locationLabel.text = formatted_address
                        }
                    } else {
                        print("🤍\(result)")
                    }
                }
            } else {
            print("Errror")
                
            }
        }
    }
    
    
    @IBAction func chooseLocationBtnPressed(_ sender: Any) {
        if self.locationLabel.text?.isEmpty == false  {
            if (self.locationLabel.text == "موقعك" || self.locationLabel.text == "Your Location") {
                Alert.showAlertOnVC(target: self, title: "You must choose a Location".localized, message: "Mark the location on the map".localized)            }else{
                delegate?.finishPassing(location: locationLabel.text! , lat: self.lat! , lng: self.lng!)
                self.dismiss(animated: true)
                
                self.navigationController?.popViewController(animated: true)
            }
            
        }
        else{
            Alert.showAlertOnVC(target: self, title: "You must choose a Location".localized, message: "Mark the location on the map".localized)
        }
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    let regionRadius: CLLocationDistance = 100
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("listen")
        centerMapOnLocation(location: locationManager.location!)
        self.locationManager.stopUpdatingLocation()
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Alert.showAlertOnVC(target: self, title: "Make sure GPS is open".localized, message: "")
    }
    
    func centerMapOnLocation(location: CLLocation){
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 17.0)
        self.googleMap.camera = camera
        
    }
    
    func getCoordinateBounds(latitude:CLLocationDegrees ,
                             longitude:CLLocationDegrees,
                             distance:Double = 0.23)->GMSCoordinateBounds{
        let center = CLLocationCoordinate2D(latitude: latitude,
                                            longitude: longitude)
        let northEast = CLLocationCoordinate2D(latitude: latitude + distance, longitude: longitude + distance)
        let southWest = CLLocationCoordinate2D(latitude: latitude - distance, longitude: longitude - distance)
        
        
        return GMSCoordinateBounds(coordinate: northEast,
                                   coordinate: southWest)
        
    }
    
    
}


class ImageAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var annotationImage: UIImage?
    var isClicked: Bool = false
    var viewTag: Int?
    
    override init() {
        self.coordinate = CLLocationCoordinate2D()
        self.title = nil
        self.annotationImage = nil
        self.viewTag = nil
    }
}

class ImageAnnotationView: MKAnnotationView {
    
    var backView = UIView()
    var annotationImgView = UIImageView()
    var annotaionLbl = UIButton()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 35)
        self.backView.frame = self.frame
        self.annotationImgView.frame = self.frame
        self.annotationImgView.isUserInteractionEnabled = true
        self.annotaionLbl.frame = CGRect(x: 0, y: 0, width: 100/1.7, height: 100/12)
        
        self.annotaionLbl.setTitleColor(UIColor.white, for: .normal)
        self.annotaionLbl.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 11.5)
        self.annotaionLbl.isUserInteractionEnabled = true
        
        self.backView.backgroundColor = UIColor.clear
        self.backView.addSubview(self.annotationImgView)
        self.backView.addSubview(self.annotaionLbl)
        
        self.addSubview(self.backView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
