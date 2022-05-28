//
//  SepetPresenter.swift
//  DenemeProject
//
//  Created by yudum ergün on 28.05.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepetYemekleriYukle(kullanici_adi:String) {
        sepetInteractor?.sepetTumYemekleriAl(kullanici_adi:kullanici_adi)
    }
    func sil(sepet_yemek_id: String,kullanici_adi:String) {
        sepetInteractor?.yemekSil(sepet_yemek_id:sepet_yemek_id, kullanici_adi:kullanici_adi)
    }
}

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi: Array<Sepet>) {
        sepetView?.vieweVeriGonder(sepetListesi: sepetListesi)
    }
}
