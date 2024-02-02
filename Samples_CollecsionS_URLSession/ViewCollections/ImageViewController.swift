//
//  ImageViewController.swift
//  Samples_CollecsionS_URLSession
//
//  Created by Dmitry Parhomenko on 31.01.2024.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchImage()
    }
    
    private func fetchImage() {
        URLSession.shared.dataTask(with: Link.imageURL.url) { [weak self] data, response, error in
            guard let self else { return }
            guard let data, let response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
                self.activityIndicator.stopAnimating()
            }
        }.resume()
    }
}
