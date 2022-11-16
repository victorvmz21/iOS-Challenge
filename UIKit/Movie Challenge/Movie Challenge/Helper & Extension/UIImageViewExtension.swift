//
//  UIImageViewExtension.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/13/22.
//

import UIKit

extension UIImageView {
    func loadImageFrom(url: String) {
        
        let cache = URLCache.shared
        var task: URLSessionDataTask?
        
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        
        if task != nil {
            task?.cancel()
        }
        
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            DispatchQueue.main.async { self.image = image }
        } else {
            task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                if let error = error {
                    print("Error Loading Image: \(error.localizedDescription)")
                    return self.image = UIImage()
                }
                
                if let data = data {
                    
                    let cachedData = CachedURLResponse(response: response!, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    
                    DispatchQueue.main.async {  self.image = UIImage(data: data) }
                }
                
            })
            
            task?.resume()
        }
    }
}
