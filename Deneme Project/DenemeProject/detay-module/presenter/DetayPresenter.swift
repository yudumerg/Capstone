//
//  DetayPresenter.swift
//  DenemeProject
//
//  Created by yudum ergün on 27.05.2022.
//

import Foundation

class DetayPresenter : ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func ekle(sepet_yemek_id:String,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String){
        detayInteractor?.yemekEkle(sepet_yemek_id: sepet_yemek_id, yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet,kullanici_adi: kullanici_adi)
    }
}
