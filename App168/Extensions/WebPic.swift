//
//  WebPic.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI
import Kingfisher

struct WebPic: View {

    var urlString: String

    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat

    var body: some View {

        let url = URL(string: urlString)!
        let resource = ImageResource(downloadURL: url, cacheKey: "\(url.absoluteString)")

        KFImage(source: .network(resource))
            .resizable()
            .placeholder {

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: width, height: height)
                    .cornerRadius(cornerRadius)
                    .overlay (

                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                    )
            }
            .downsampling(size: CGSize(width: width, height: height))
            .cacheOriginalImage()
            .frame(width: width, height: height)
            .cornerRadius(cornerRadius)
    }
}
