//
//  ViewController+Constraint.swift
//  SPIR
//
//  Created by Alexander Trifonov on 31.05.2020.
//  Copyright © 2020 TASS. All rights reserved.
//

import UIKit

extension ViewController {
    
    @objc
    func willShowKeyboard(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else { return }
        self.buildContent(keyboardHeight: frame.size.height)
        UIView.animate(withDuration: TimeInterval(duration.floatValue), animations: {
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        })
    }

    @objc
    func willHideKeyboard(_ notification: Notification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else { return }
        self.buildContent(keyboardHeight: 0)
        UIView.animate(withDuration: TimeInterval(duration.floatValue), animations: {
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded()
        })
    }

}
