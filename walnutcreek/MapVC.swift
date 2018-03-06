//
//  File.swift
//  walnutcreek
//
//  Created by Lewis Black on 03/03/2018.
//  Copyright © 2018 Lewis Black. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class MapVC:UIViewController{
    
    @IBOutlet weak var map:MKMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    var selectedPoint:Point?

    
    var developments:[Development] = [
      
    ]
    
    var climatePoints:[ClimateChangePoint] = [
        ClimateChangePoint(name: "Transport Links", latitude: 37.8942872, longitude: -122.0655747, picURL: URL(string:"https://maps.googleapis.com/maps/api/streetview?size=800x800&location=37.8958991,-122.0530707&heading=151.78&pitch=-0.76&key=AIzaSyDKtwyvjK0fUXzutFqWeglncRH_u_E-ZC0")!, address: "The top source of emision in Walnut Creek in 2013 was transportation at 61%", status: "This year we have reduced transportation emision by 5% by promoting public transport", type: " ")
    ]
    
    override func viewDidLoad() {
        map.delegate = self
        
        self.title = "The Walnut Creek Map"

        FirPickUp.getAllDevs { (points) in
            self.developments = points
            self.map.removeAnnotations(self.map.annotations)
            self.addDevelopments()
        }
        addAll()

        map.centerZoomedInOn(latitude: 37.8965546, longitude: -122.0609372)
    }
    
    
    @IBAction func onControlPressed(_ sender: Any) {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
        map.removeAnnotations(map.annotations)

        switch segmentedControl.selectedSegmentIndex {
        case 0:
            addAll()
        case 1:
            addDevelopments()
        default:
            addClimatePoints()
        }
        
        map.reloadInputViews()
    }
    
    private func addDevelopments(){
        for development in developments {
            map.addAnnotation(development)
        }
    }
    private func addClimatePoints(){
        for development in climatePoints {
            map.addAnnotation(development)
        }
        
    }
    private func addAll(){
        addDevelopments()
        addClimatePoints()
    }
}

import CoreLocation

class Development:Point {
//    override init(name:String, latitude:Double, longitude:Double) {
//        super.init(name: name, latitude: latitude, longitude: longitude)
//    }
    
    
}

class ClimateChangePoint:Point {
//    override init(name:String, latitude:Double, longitude:Double) {
//        super.init(name: name, latitude: latitude, longitude: longitude, picURL: <#URL#>)
//    }
    
    
}


class Point: NSObject, MKAnnotation {
    
    private (set) public var latitude:Double
    private (set) public var longitude:Double
    private (set) public var name:String
    private (set) public var address:String
    private (set) public var type:String
    private (set) public var status:String

    private (set) public var url:URL

    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    public var title: String? {
        return name
    }
    
    init(name:String, latitude:Double, longitude:Double, picURL:URL, address:String, status: String, type:String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.url = picURL
        self.address = address
        self.status = status
        self.type = type
    }
}

extension MKMapView {
    
    private func centerOn(latitude: CLLocationDegrees, longitude: CLLocationDegrees, withRadius radius: CLLocationDistance) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radius * 2.0, radius * 2.0)
        self.setRegion(coordinateRegion, animated: true)
    }
    
    public func centerZoomedInOn(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let radius:CLLocationDistance = 1000
        self.centerOn(latitude: latitude, longitude: longitude, withRadius: radius)
    }
    
    public func centerZoomedOutOn(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let radius:CLLocationDistance = 7000
        self.centerOn(latitude: latitude, longitude: longitude, withRadius: radius)
    }
}



extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Point {
            let identifier = "pin"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: 0, y: 5)
//                var image = #imageLiteral(resourceName: "fooballpin")
//                if annotation is Development {
//                    
//                }
                if annotation is Development{
                    view.image = #imageLiteral(resourceName: "fooballpin")

                } else {
                    return nil
                }
                
                view.centerOffset = CGPoint(x: 0, y: -20);
                view.rightCalloutAccessoryView = UIButton(type: .infoDark)

            }
            
            return view
        }
        return nil
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        selectedPoint = view.annotation as? Point
        self.performSegue(withIdentifier: "toMessage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard selectedPoint != nil else {fatalError("SelectedGame = nil")}
            if let messageVC = segue.destination as? MessageVC {
                messageVC.point = selectedPoint
                selectedPoint = nil
            }
        
    }
}
