//
//  ViewController.swift
//  Onde estou
//
//  Created by Fabiano De Souza Pereira on 06/02/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var fieldVelocidade: UILabel!
    @IBOutlet weak var fieldLatitude: UILabel!
    @IBOutlet weak var fieldLongitude: UILabel!
    @IBOutlet weak var fieldEndereco: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let localizacaoUsuario = locations.last
        let latitude = localizacaoUsuario?.coordinate.latitude
        let longitude = localizacaoUsuario?.coordinate.longitude
    
        
        fieldLatitude.text = String(latitude!)
        fieldLongitude.text = String(longitude!)
        fieldVelocidade.text = String( localizacaoUsuario!.speed )
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    
        if status != .authorizedWhenInUse {
            
            let alertaController = UIAlertController(title: "Permissão de localização", message: "Necessário permissão para acesso à sua localização! Por favor habilite.", preferredStyle: .alert)
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir configuracões", style: .default, handler: {( alertaConfiguracoes ) in
                
//                if let bundleId = Bundle.main.bundleIdentifier,
//                    let configuracoes = NSURL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")
                    
                if  let configuracoes = NSURL(string: UIApplication.openSettingsURLString )
                        
                {
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            
            present ( alertaController, animated: true, completion: nil )
            
        }
        
    }


}

