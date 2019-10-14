//
//  UIViewController+Additions.swift
//  Clouds
//
//  Created by Pablo Epíscopo on 10/14/19.
//  Copyright © 2019 Pablo Epíscopo. All rights reserved.
//

import UIKit

extension UIViewController {

    func delay(_ delay: Double, closure: @escaping () -> ()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }

    func asyncMain(_ closure: @escaping () -> ()) {
        DispatchQueue.main.async(execute: closure)
    }

}
