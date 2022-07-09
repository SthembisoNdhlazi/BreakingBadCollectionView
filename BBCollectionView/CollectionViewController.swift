//
//  CollectionViewController.swift
//  BBCollectionView
//
//  Created by IACD-020 on 2022/07/09.
//

import UIKit



class CollectionViewController: UICollectionViewController {
var dataProvider = DataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Breaking bad"
        dataProvider.downloadJson {
            self.collectionView.reloadData()
            print("success")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return dataProvider.characters?.count ?? 0
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let characterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell{
            
            if let characters = dataProvider.characters{
                let character = characters[indexPath.row]
                characterCell.setUp(character: character)
                cell = characterCell
            }
            
            
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "showDetails", sender: self)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        vc?.character = dataProvider.characters![indexPath.row]
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
  
   
}

