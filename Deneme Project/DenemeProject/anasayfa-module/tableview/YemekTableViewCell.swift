//
//  YemekTableViewCell.swift
//  DenemeProject
//
//  Created by yudum ergün on 27.05.2022.
//

import UIKit

protocol HucreProtocol{
    
    func buttonTiklandi(indexPath:IndexPath)
    
}
class YemekTableViewCell: UITableViewCell {
    
    @IBOutlet weak var yemekResimImageView: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
