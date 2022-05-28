//
//  detayProtocols.swift
//  DenemeProject
//
//  Created by yudum ergün on 27.05.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    var detayInteractor:PresenterToInteractorDetayProtocol? {get set}
    
    func ekle(sepet_yemek_id:String,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
}

protocol PresenterToInteractorDetayProtocol {
    func yemekEkle(sepet_yemek_id:String,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
}

protocol PresenterToRouterDetayProtocol {
    static func createModule(ref:DetayVC)
}
