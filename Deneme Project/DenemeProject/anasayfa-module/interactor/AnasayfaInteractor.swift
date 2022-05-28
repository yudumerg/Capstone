//
//  AnasayfaInteractor.swift
//  DenemeProject
//
//  Created by yudum ergün on 27.05.2022.
//


import Foundation

import Alamofire

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data  = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self,from: data)
                    if let liste = cevap.yemekler {
                        self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    }
                }catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
    }
    
}
