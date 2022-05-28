//
//  SepetVC.swift
//  DenemeProject
//
//  Created by yudum ergün on 28.05.2022.
//

import UIKit

class SepetVC: UIViewController {

    var userName:String?
    
    @IBOutlet weak var SepetTableView: UITableView!
    var sepetListe = [Sepet]()
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SepetTableView.delegate = self
        SepetTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)
      
    }
    override func viewWillAppear(_ animated: Bool) {
        userName = "yudum_ergun"
        sepetPresenterNesnesi?.sepetYemekleriYukle(kullanici_adi: userName!)
    }
    
}
extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetListesi: Array<Sepet>) {
        self.sepetListe = sepetListesi

        DispatchQueue.main.async {
            self.SepetTableView.reloadData()
        }
    }
}
extension SepetVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet  = sepetListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        
        
        //cell.yemekResimImageView.image = UIImage(named: yemek.yemek_resim_adi!)
        cell.sepetYemekAdiLabel.text = "\(sepet.yemek_adi!)"
        cell.sepetYemekFiyatLabel.text = "\(sepet.yemek_fiyat!)₺"
        //cell.indexPath = indexPath
        DispatchQueue.main.async {
                    let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)")
                    cell.sepetYemekResimImage.kf.setImage(with: url)
                }
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let yemek = self.sepetListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepetPresenterNesnesi?.sil(sepet_yemek_id: String(yemek.sepet_yemek_id!),kullanici_adi: (self.userName!))
                self.userName = "yudum_ergun"
                self.sepetPresenterNesnesi?.sepetYemekleriYukle(kullanici_adi: self.userName!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
