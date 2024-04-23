import Foundation
import AppKit
import SwiftUI

public class ImageManager {
    public static let shared = ImageManager()
    private let cache = NSCache<NSURL, NSImage>()
    
    private init() {}
    
    public func getImage(from url: URL, completion: @escaping (NSImage?) -> Void) {
        // Check if the image is already in cache
        if let cachedImage = cache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }
        
        // Image not in cache, download it
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = NSImage(data: data) else {
                completion(nil)
                return
            }
            
            // Cache the image for future use
            self.cache.setObject(image, forKey: url as NSURL)
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}
