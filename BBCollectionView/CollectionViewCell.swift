//
//  CollectionViewCell.swift
//  BBCollectionView
//
//  Created by IACD-020 on 2022/07/09.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var characterImage: UIImageView!
    
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    
    func setUp(character:Character){
        nameLabel.text = character.name
        nicknameLabel.text = character.nickname
        characterImage.downloaded(from: character.img)
    
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
