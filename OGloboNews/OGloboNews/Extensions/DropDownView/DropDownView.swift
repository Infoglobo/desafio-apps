//
//  DropDownView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 24/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class DropDownView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    private var timer: Timer?
    private var animationDTO: DropDownAnimationDTO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageLabel.text = ""
    }
    
    func show(type: DropDownType) {
        animationDTO = type.animationDTO
        backgroundColor = type.color
        messageLabel.text = type.message
        messageLabel.textColor = type.textColor
        imageView.image = type.image
        startAnimation()
    }
    
    private func startAnimation() {
        guard let dto = animationDTO else {
            return
        }
        setPosition(visible: false)
        UIView.animate(withDuration: dto.animationDuration, delay: dto.animationDelay, usingSpringWithDamping: dto.springDamping,
                       initialSpringVelocity: dto.springVelocity, options: [], animations: {
                        self.setPosition(visible: true)
        }, completion: nil)
        timer = Timer.scheduledTimer(timeInterval: dto.visibleTime, target: self, selector: #selector(dismiss), userInfo: nil, repeats: false)
    }
    
    @objc func dismiss() {
        timer?.invalidate()
        UIView.animate(withDuration: animationDTO?.animationDuration ?? 0.5, animations: {
            self.setPosition(visible: false)
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
    
    private func setPosition(visible: Bool) {
        var frame = self.frame
        frame.origin.y = visible ? 0 : -(self.frame.size.width)
        self.frame = frame
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss()
    }
    
}
