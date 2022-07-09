//
//  DetailsViewController.swift
//  BBCollectionView
//
//  Created by IACD-020 on 2022/07/09.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var characterImg: UIImageView!
    var character : Character?
    @IBOutlet var nameLbl: UILabel!
    
    @IBOutlet var birthdayLbl: UILabel!
    @IBOutlet var portrayedLbl: UILabel!
    @IBOutlet var statusLbl: UILabel!
    @IBOutlet var nicknameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = "Name: \(character?.name ?? "")"
        nicknameLbl.text = "Nickname: \(character?.nickname ?? "")"
        birthdayLbl.text = "Birthday: \(character?.birthday ?? "")"
        portrayedLbl.text = "Portrayed by: \(character?.portrayed ?? "")"
        statusLbl.text = "Status: \(character?.status ?? "")"
        characterImg.downloaded(from: character!.img)
    }
    

   

}
