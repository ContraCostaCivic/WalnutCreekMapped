//
//  ImageDownloader.swift
//  Celebreak
//
//  Created by Lewis Black on 23/01/2018.
//  Copyright © 2018 Lewis Black. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    
    //    public static func downloadImage(url: URL, onCompletion:@escaping (UIImage) -> ()) {
    //        getDataFromUrl(url: url) { (data, response, error)  in
    //            guard let data = data, error == nil else {
    //                print("hereisprob")
    //                return }
    //            if let image = UIImage(data: data) {
    //                onCompletion(image)
    //            }
    //        }
    //    }
    //
    
    public static func downloadImageAndShow(url: URL, setAs button: UIButton) {
        downloadImageAndCall(url: url) { image in
            button.setImage(image, for: .normal)
        }
    }
    public static func downloadImageAndShow(url: URL, setAs imageView: UIImageView) {
        downloadImageAndCall(url: url) { image in
            imageView.image = image
        }
    }
    
    private static func downloadImageAndCall(url: URL, onSuccess: @escaping (UIImage) -> ()) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else {
                print("hereisprob")
                return }
            DispatchQueue.main.async() { () -> Void in
                if let image = UIImage(data: data) {
                    onSuccess(image)
                }
            }
        }
    }
    
    
    private static func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    
}

