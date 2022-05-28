//
//  SepetProtocols.swift
//  DenemeProject
//
//  Created by yudum ergün on 28.05.2022.
//

import Foundation


protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func sepetYemekleriYukle(kullanici_adi:String)
    func sil(sepet_yemek_id:String,kullanici_adi:String)

}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func sepetTumYemekleriAl(kullanici_adi:String)
    func yemekSil(sepet_yemek_id:String,kullanici_adi:String)
}

//Taşıyıcı protocoller
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi:Array<Sepet>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetListesi:Array<Sepet>)
}

//Router protocol
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}
