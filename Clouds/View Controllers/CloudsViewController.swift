//
//  CloudsViewController.swift
//  Clouds
//
//  Created by Pablo Epíscopo on 10/14/19.
//  Copyright © 2019 Pablo Epíscopo. All rights reserved.
//

import UIKit

class CloudsViewController: UIViewController {

    private var imageViews = [UIImageView]()
    private var animations = [CAAnimation]()

    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        return gesture
    }()

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Tap anywhere to add clouds", comment: "")
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
        label.textColor = .black
        label.backgroundColor = .white
        label.sizeToFit()
        label.center = view.center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initGUI()
    }

    // MARK: Private methods

    private func initGUI() {
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func tapGesture(_ gesture: UITapGestureRecognizer) {
        if welcomeLabel.alpha > 0.0 {
            UIView.animate(withDuration: 0.4) { [weak self] in
                self?.welcomeLabel.alpha = 0.0
            }
        }
        let number = Int.random(in: 1...49)
        let imageView = UIImageView(image: UIImage(named: "cloud-\(number)"))
        imageViews.append(imageView)

        let viewWidth = Int(view.bounds.size.width)
        let viewHeight = Int(view.bounds.size.height)
        let imageViewWidth = Int(imageView.frame.size.width)
        let imageViewHeight = Int(imageView.frame.size.height)
        let randomX = CGFloat(Int.random(in: -imageViewWidth...viewWidth))
        let randomY = CGFloat(Int.random(in: -imageViewHeight...viewHeight))
        imageView.frame.origin = CGPoint(x: randomX, y: randomY)
        view.addSubview(imageView)

        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.duration = 1.6
        fadeAnimation.autoreverses = true
        fadeAnimation.fromValue = 0.4
        fadeAnimation.toValue = 1.0
        fadeAnimation.repeatCount = Float.infinity
        fadeAnimation.fillMode = CAMediaTimingFillMode.both
        animations.append(fadeAnimation)

        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 0.8
        scaleAnimate.toValue = 1.0
        scaleAnimate.duration = 3
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = Float.infinity
        scaleAnimate.fillMode = CAMediaTimingFillMode.both
        animations.append(scaleAnimate)

        imageView.layer.add(scaleAnimate, forKey: "scaleAnimation")
        imageView.layer.add(fadeAnimation, forKey: "fadeAnimation")
    }

}
