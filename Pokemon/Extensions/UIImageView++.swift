//
//  UIImageView++.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, _ completion: @escaping () -> Void) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion()
                    }
                }
            }
        }
    }
}
