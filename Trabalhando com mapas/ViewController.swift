//
//  ViewController.swift
//  Trabalhando com mapas
//
//  Created by Fabiano De Souza Pereira on 01/02/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var gerenciadorLocal = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoUsuario: CLLocation = locations.last!
        
        //monta exibicao do mapa
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude

        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude

        let deltaLatitude: CLLocationDegrees = 0.01

        let deltaLongitude: CLLocationDegrees = 0.01


        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)

        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)



        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao)
        map.setRegion(regiao, animated: true)
        
    }


}

