//
//  ImageViewModel.swift
//  ocado_challenge
//
//  Created by MAC on 27/05/2022.
//

import Combine
import SwiftUI

final class ImageViewModel:ObservableObject {
    @Published var image = Image(systemName: "camera")
    var subscribers = Set<AnyCancellable>()
    
    func getNetworkImage(imageUrl: String) {
        URLSession.shared
            .dataTaskPublisher(for: URL(string: imageUrl)!)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .compactMap { UIImage(data: $0) }
            .map { Image(uiImage: $0) }
            .replaceEmpty(with: Image(systemName: "camera"))
            .replaceError(with: Image(systemName: "camera"))
            .assign(to: \.image, on: self)
            .store(in: &subscribers)
    }
}
