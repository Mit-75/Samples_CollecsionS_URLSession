//
//  MainViewController.swift
//  Samples_CollecsionS_URLSession
//
//  Created by Dmitry Parhomenko on 31.01.2024.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    
    // MARK: - Navigation
    
    //MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    
}
