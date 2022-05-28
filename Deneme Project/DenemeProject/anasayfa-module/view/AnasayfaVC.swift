//
//  ViewController.swift
//  DenemeProject
//
//  Created by yudum ergün on 27.05.2022.
//

import UIKit
import Kingfisher

class AnasayfaVC: UIViewController {
    
    @IBOutlet weak var yemekTableView: UITableView!
    var yemeklerListe = [Yemekler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        yemekTableView.delegate = self
        yemekTableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "toDetay" {
                if let yemek = sender as? Yemekler {
                    let gidilecekVC = segue.destination as! DetayVC
                    gidilecekVC.yemek = yemek
                    
                }
            }
        
    }
    
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi

        DispatchQueue.main.async {
            self.yemekTableView.reloadData()
        }
    }
}
extension AnasayfaVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek  = yemeklerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "yemekHucre", for: indexPath) as! YemekTableViewCell
        
        
        //cell.yemekResimImageView.image = UIImage(named: yemek.yemek_resim_adi!)
        cell.yemekAdiLabel.text = "\(yemek.yemek_adi!)"
        cell.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!)₺"
        //cell.indexPath = indexPath
        DispatchQueue.main.async {
                    let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
                    cell.yemekResimImageView.kf.setImage(with: url)
                }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
   // func buttonTiklandi(indexPath: IndexPath) {
     //   let yemek = yemeklerListe[indexPath.row]
       // print("\(yemek.yemek_adi!) tiklandi")
    //}
    
}
