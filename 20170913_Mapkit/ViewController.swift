//
//  ViewController.swift
//  20170913_Mapkit
//
//  Created by D7703_13 on 2017. 9. 13..
//  Copyright © 2017년 D7703_13. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpanMake(0.05,0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        mapView.setRegion(region, animated: true)
        
        let anno01 = MKPointAnnotation()
        anno01.coordinate = center
        anno01.title = "DIT"
        anno01.subtitle = "동과대"
        
        // 부산시민공원 35.168444, 129.057832
        let busanSimin = locationInformation.init(coordinate: CLLocationCoordinate2DMake(35.168444, 129.057832), title: "부산 시민 공원", subtitle: "부산 공원", info: "busan")
        
        let dit = locationInformation.init(coordinate: CLLocationCoordinate2DMake(35.166197, 129.072594), title: "DIT", subtitle: "동과대", info: "동의과학대")
        
        
        mapView.addAnnotations([busanSimin,dit])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPin"
        var  annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            
            leftIconView.image = UIImage(named:"dit.png" )
            annotationView?.leftCalloutAccessoryView = leftIconView
            
            if annotation.title! == "부산 시민 공원" {
                annotationView?.pinTintColor = UIColor.green
                
                leftIconView.image = UIImage(named:"simin.png" )
                annotationView?.leftCalloutAccessoryView = leftIconView
                
                
            }
            
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
        
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        print("he he clicked")
        let anno = view.annotation
        let aTitle = anno?.title
        let aSubTitle = anno?.subtitle
        
        let ac = UIAlertController(title: aTitle! ,message: aSubTitle! , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(ac, animated: true, completion: nil)
        
    }



}

