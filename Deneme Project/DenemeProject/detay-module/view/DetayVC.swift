//
//  DetayVC.swift
//  DenemeProject
//
//  Created by yudum ergün on 27.05.2022.
//

import UIKit

class DetayVC: UIViewController {
    
 
    @IBOutlet weak var yemekResimImageView: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    @IBOutlet weak var stepperLabel: UILabel!
    var yemek:Yemekler?
    var userName:String?
    
    var detayPresenterNesnesi:ViewToPresenterDetayProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yemek {
            yemekResimImageView.image = UIImage(named: y.yemek_resim_adi!)
            yemekAdiLabel.text = "\(y.yemek_adi!)"
            yemekFiyatLabel.text = "\(y.yemek_fiyat!) ₺"
            userName = "yudum_ergun"
        }
        DetayRouter.createModule(ref: self)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let stepper = Int(sender.value)
        stepperLabel.text = String(stepper)
    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if let ya = yemekAdiLabel.text, let sl = stepperLabel.text, let ka = userName, let y = yemek{
            detayPresenterNesnesi?.ekle(sepet_yemek_id: ya, yemek_adi: ya, yemek_resim_adi: (y.yemek_resim_adi!), yemek_fiyat: (y.yemek_fiyat!), yemek_siparis_adet: sl, kullanici_adi:ka)
        }
    }
    
}
