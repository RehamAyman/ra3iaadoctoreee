//
//  TrackViewController.swift
//  Ra3ia
//
//  Created by Sara Mady on 01/06/2021.
//

//import UIKit
//import GoogleMaps
//import CoreLocation
//import MapKit
//import SocketIO
//
//class TrackViewController: UIViewController , GMSMapViewDelegate{
//
//    @IBOutlet var mapView: MKMapView?
//    @IBOutlet weak var backButton: UIButton!
//    @IBOutlet weak var googleMApView: GMSMapView!
//
//    let locationManager = CLLocationManager()
//    let GoogleAPI = User.currentUser!.googlekey
//    var userTrackId = ""
//
//    var ResiverLat:Double?
//    var ResiverLong:Double?
//
//    var latitude:Double!
//    var longitude:Double!
//
//    var DeliverLat = 0.0
//    var DeliverLng = 0.0
//
//    var Userelat = 0.0
//    var UserLng = 0.0
//    let Delgateannotation = ImageAnnotation()
//    let delegateMarker = GMSMarker()
//
//
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        self.mapView?.delegate = self
//        self.googleMApView.delegate = self
//        self.googleMApView.animate(toZoom: 10)
//        let camera = GMSCameraPosition.camera(withLatitude:  Double(User.currentUser!.lat!)!, longitude: Double(User.currentUser!.lng!)!, zoom: 15)
//        self.googleMApView.camera = camera
//        self.locationManager.requestAlwaysAuthorization()
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.startUpdatingLocation()
//        } else {
//            locationManager.requestWhenInUseAuthorization()
//            locationManager.requestAlwaysAuthorization()
//        }
//    }
//
//    @IBAction func goBack(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
//    }
//    override func viewWillAppear(_ animated: Bool) {
////        print("Delver🌹:\(self.DeliverLat),\(self.DeliverLng)")
////        print("Resive🌹:\(self.ResiverLat),\(self.ResiverLong)")
////        print("Delgate🌹:\(Double(User.currentUser!.lat)!),\(Double(User.currentUser!.lng)!)")
//        DrawAnnotion(lat: self.DeliverLat, long: self.DeliverLng)
//        self.addResiveLocation(lat: self.ResiverLat!, Long: self.ResiverLong!)
//        self.addDelgate(lat:Double(User.currentUser!.lat !,Double(User.currentUser!.lng!)!),
//
//                        Long: print("🌏\( SocketConnection.sharedInstance.socket.status)"),
//        SockeConFigration()
//    }
//
//    func SockeConFigration(){
//
//        let test = ["tracker_id": User.currentUser!.id, "user_id": self.userTrackId] as [String : Any]
//        SocketConnection.sharedInstance.socket.emit("addtracker", test)
//        SocketConnection.sharedInstance.socket.on("trackorder") { (data, ack) in
//            print("🇨🇳\(data)")
//            guard let dict = data[0] as? [String: Any] else { return }
//            self.Userelat = dict["lat"] as! Double
//            self.UserLng = dict["lng"] as! Double
//            self.addDelgate(lat: self.Userelat,Long: self.UserLng)
//        }
//
//
//    }
//    func DrawAnnotion(lat:Double,long:Double){
//        //=======client
////        let annotation = ImageAnnotation()
////        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
////        annotation.annotationImage = #imageLiteral(resourceName: "vector")
////        annotation.isClicked = false
////        mapView?.addAnnotation(annotation)
////        print("🚘\(annotation.coordinate.latitude),\(annotation.coordinate.longitude)")
//        //    annotation.viewTag = self.projects[i].id!
//
//        //====================google
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: Double(lat), longitude: Double(long))
//        marker.icon = #imageLiteral(resourceName: "deliv")
//        marker.map = googleMApView
//    }
//    func addResiveLocation(lat:Double,Long:Double){
//        //==========store
////        let annotation = ImageAnnotation()
////        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: Long)
////        annotation.annotationImage = #imageLiteral(resourceName: "vectorstore")
////        annotation.isClicked = false
////        mapView?.addAnnotation(annotation)
//        //    annotation.viewTag = self.projects[i].id!
//
//        //====================google
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: Double(lat), longitude: Double(Long))
//        marker.icon = #imageLiteral(resourceName: "clientloc")
//        marker.map = googleMApView
//
//    }
//    func addDelgate(lat:Double,Long:Double){
//        //========delegate
//
////        self.mapView?.removeAnnotations((self.mapView?.annotations)!)
////        self.Delgateannotation.coordinate = CLLocationCoordinate2D(latitude: Double(lat), longitude: Double(Long))
////        self.Delgateannotation.annotationImage = #imageLiteral(resourceName: "bus")
////        self.Delgateannotation.isClicked = false
////        mapView?.addAnnotation(  self.Delgateannotation)
////        DrawAnnotion(lat: self.DeliverLat, long: self.DeliverLng)
////        self.addResiveLocation(lat: self.ResiverLat!, Long: self.ResiverLong!)
////        print("delgatee")
//
//
//        //====================google
//        delegateMarker.position = CLLocationCoordinate2D(latitude: Double(lat), longitude: Double(Long))
//        delegateMarker.icon = #imageLiteral(resourceName: "loca-1")
//        delegateMarker.map = googleMApView
//
//    }
//
//
//    let regionRadius: CLLocationDistance = 300
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
//                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
//        mapView?.setRegion(coordinateRegion, animated: true)
//    }
//
//
//
//}
//extension TrackViewController : CLLocationManagerDelegate{
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        Alert.showAlertOnVC(target: self, title: "تأكد من فتح ال GPS", message: "")
//    }
//}
//extension TrackViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        if annotation.isKind(of: ImageAnnotation.self) {
//
//            var view: ImageAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: "imageAnnotation") as? ImageAnnotationView
//            if view == nil {
//                view = ImageAnnotationView(annotation: annotation, reuseIdentifier: "imageAnnotation")
//
//            }
//
//            let annotation = annotation as! ImageAnnotation
//            view?.annotationImgView.image = annotation.annotationImage
//            view?.annotaionLbl.setTitle(annotation.title, for: .normal)
//            view?.annotation = annotation
//
//            return view
//        }else{
//
//        }
//        return nil
//    }
//}
//
