//
//  SepetInteractor.swift
//  DenemeProject
//
//  Created by yudum ergün on 28.05.2022.
//

import Foundation

import Alamofire

class SepetInteractor : PresenterToInteractorSepetProtocol {

    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
        
        func sepetTumYemekleriAl(kullanici_adi:String){
            
            let params = ["kullanici_adi": kullanici_adi]
            
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post,  parameters: params).response { response in
                if let data = response.data {
                    do{
                        let cevap = try JSONDecoder().decode(SepetCevap.self, from: data)
                        if let liste = cevap.sepet_yemekler{
                            self.sepetPresenter?.presenteraVeriGonder(sepetListesi: liste)
                            
                        }
                    }catch{
                        print(error.localizedDescription)
                        print(String(describing: error))
                    }
                }
            }
        }
        
    func yemekSil(sepet_yemek_id: String,kullanici_adi:String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response { response in
            if let data  = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetCevap.self, from: data)
                    if let liste = cevap.sepet_yemekler{
                        self.sepetPresenter?.presenteraVeriGonder(sepetListesi: liste)
                    }
                }
                    catch
                    {
                    print(error.localizedDescription)
                        
                    }
            }
        }
    
        }
}

