import Foundation
import AppKit
import SwiftUI

public struct AsyncImageView: View {
    public let url: URL
    public let maxImageSize: CGFloat
    @State private var image: NSImage? = nil
    
    public init(url: URL, maxImageSize: CGFloat) {
        self.url = url
        self.maxImageSize = maxImageSize
    }
    
    public var body: some View {
        Group {
            if let image = image {
                Image(nsImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: maxImageSize, maxHeight: maxImageSize)
            } else {
                Image(systemName: "photo.badge.arrow.down.fill")
                    .frame(maxWidth: maxImageSize, maxHeight: maxImageSize)
                    .onAppear {
                        ImageManager.shared.getImage(from: url) { fetchedImage in
                            self.image = fetchedImage
                        }
                    }
            }
        }
    }
}
