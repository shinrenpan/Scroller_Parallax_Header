//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main.Views {
    final class HeaderView: UIView {
        static let height = 280.0
        lazy var imgView = makeImgView()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            clipsToBounds = false
            
            addSubview(imgView)
            NSLayoutConstraint.activate([
                imgView.topAnchor.constraint(equalTo: topAnchor),
                imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imgView.bottomAnchor.constraint(equalTo: bottomAnchor),
                imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

// MARK: - Reload Something

extension Main.Views.HeaderView {
    func reloadUI(offsetY: CGFloat) {
        if offsetY < 0 {
            var transform = CATransform3DTranslate(CATransform3DIdentity, 0, offsetY, 0)
            let scaleFactor = 1 + (-1 * offsetY / (Main.Views.HeaderView.height / 2))
            transform = CATransform3DScale(transform, scaleFactor, scaleFactor, 1)
            imgView.layer.transform = transform
        }
        else {
            imgView.layer.transform = CATransform3DIdentity
        }
    }
}

// MARK: - Make Something

private extension Main.Views.HeaderView {
    func makeImgView() -> UIImageView {
        let result = UIImageView(image: .init(named: "banner"))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.contentMode = .scaleAspectFill
        return result
    }
}
