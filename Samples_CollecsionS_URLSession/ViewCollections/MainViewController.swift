//
//  MainViewController.swift
//  Samples_CollecsionS_URLSession
//
//  Created by Dmitry Parhomenko on 31.01.2024.
//

import UIKit

final class MainViewController: UICollectionViewController {
    
    let userActions = UserAction.allCases
    
    //MARK: - UICollectionViewDataSource
    
    /// Задаем колличество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    /// Создаем ячейки, присваиваем наименования
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else { return UICollectionViewCell() }
        cell.userActionLabel.text = userActions[indexPath.item].title
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    /// Присваиваем действия ячейкам
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
    
    // MARK: - Private Methods
    /// Метод Алерт
    private func showAlert(withStatus status: Alert) {
        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        DispatchQueue.main.async { [unowned self] in
            present(alert, animated: true)
        }
    }
}
/// Делаем динамическую ширину ячейки 
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
        URLSession.shared.dataTask(with: Link.courseURL.url) { [weak self]
            data, _, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course)
                showAlert(withStatus: .success)
            } catch {
                print(error.localizedDescription)
                showAlert(withStatus: .failed)
            }
        }.resume()
    }
    
    private func fetchCourses() {
        URLSession.shared.dataTask(with: Link.coursesURL.url) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                showAlert(withStatus: .success)
            } catch {
                print(error.localizedDescription)
                showAlert(withStatus: .failed)
            }
        }.resume()
    }
    
    private func fetchInfoAboutUs() {
        URLSession.shared.dataTask(with: Link.aboutUsURL.url) { [weak self]
            data, _, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let sbInfo = try JSONDecoder().decode(SwiftBookInfo.self, from: data)
                print(sbInfo)
                showAlert(withStatus: .success)
            } catch {
                print(error.localizedDescription)
                showAlert(withStatus: .failed)
            }
        }.resume()
        
    }
    
    private func fetchInfoAboutUsWithEmptyFields() {
        URLSession.shared.dataTask(with: Link.aboutUsURL2.url) { [weak self]
            data, _, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let sbInfo2 = try JSONDecoder().decode(SwiftBookInfo.self, from: data)
                print(sbInfo2)
                showAlert(withStatus: .success)
            } catch {
                print(error)
                showAlert(withStatus: .failed)
            }
        }.resume()
        
    }
  
}
    
    

