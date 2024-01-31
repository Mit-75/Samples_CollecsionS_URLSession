//
//  MainViewController.swift
//  Samples_CollecsionS_URLSession
//
//  Created by Dmitry Parhomenko on 31.01.2024.
//

import UIKit

final class MainViewController: UICollectionViewController {
    
    let userActions = UserAction.allCases
    
    
    // MARK: - Navigation
    
    //MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else { return UICollectionViewCell() }
        cell.userActionLabel.text = userActions[indexPath.item].title
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
            
        case .showImage: performSegue(withIdentifier: "showImage", sender: nil)
            
        case .fetchCourse:fetchCourse()
        case .fetchCourses: fetchCourses()
        case .aboutSwiftBook: fetchInfoAboutUs()
        case .aboutSwiftBook2: fetchInfoAboutUsWithEmptyFields()
        case .showCourses: performSegue(withIdentifier: "showCourses", sender: nil)
        }
    }
    
}
    
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 90)
    }
}

// MARK: - Networking

extension MainViewController {
    
    private func fetchCourse() {
        
    }
    
    private func fetchCourses() {
        
    }
    
    private func fetchInfoAboutUs() {
        
    }
    
    private func fetchInfoAboutUsWithEmptyFields() {
        
    }
  
}
    
    

