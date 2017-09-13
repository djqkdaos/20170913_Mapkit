import UIKit
import MapKit
class locationInformation: NSObject,MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var info: String
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, info: String ) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.info = info
    }
    
}
