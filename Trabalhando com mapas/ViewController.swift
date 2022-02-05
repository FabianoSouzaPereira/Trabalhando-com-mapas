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
        
        
       /* let latitude: CLLocationDegrees = -23.586974

        let longitude: CLLocationDegrees = -46.657355

        let deltaLatitude: CLLocationDegrees = 0.01

        let deltaLongitude: CLLocationDegrees = 0.01


        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)

        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)



        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao)

        map.setRegion(regiao, animated: true)
        
        let anotacao = MKPointAnnotation()



        //Configurar

        anotacao.coordinate = localizacao

        anotacao.title = "Parque Ibirapuera"

        anotacao.subtitle = "Parque localizado na cidade de São Paulo"



        map.addAnnotation(anotacao) */
        
        
    }


}

