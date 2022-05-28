//
//  SepetRouter.swift
//  DenemeProject
//
//  Created by yudum ergün on 28.05.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC) {
        let presenter = SepetPresenter()
        
        //View
        ref.sepetPresenterNesnesi = presenter
        
        //Presenter
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        //Interactor
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}

