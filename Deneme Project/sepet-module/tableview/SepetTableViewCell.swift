//
//  SepetTableViewCell.swift
//  DenemeProject
//
//  Created by yudum ergün on 28.05.2022.
//

import UIKit

protocol SepetHucreProtocol{
    
    func buttonTiklandi(indexPath:IndexPath)
    
}
class SepetTableViewCell: UITableViewCell {

    @IBOutlet weak var sepetYemekResimImage: UIImageView!
    @IBOutlet weak var sepetYemekAdiLabel: UILabel!
    @IBOutlet weak var sepetYemekFiyatLabel: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
