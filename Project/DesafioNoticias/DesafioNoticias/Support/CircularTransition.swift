//
//  CircularTransition.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 07/11/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {
    
    var circle = UIView()
    
    var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }
    
    var circleColor = UIColor.white
    
    var duration = 0.8
    
    enum CircularTransitionMode : Int {
        case present, dismiss, pop
    }

    var transitionMode : CircularTransitionMode = .present
    
}

extension CircularTransition : UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        if self.transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                self.circle.frame = self.frameForCircle(withViewCenter: viewCenter, size: viewSize, andStartPoint: self.startingPoint)
                
                self.circle.layer.cornerRadius = self.circle.frame.size.height / 2
                self.circle.center = self.startingPoint
                self.circle.backgroundColor = self.circleColor
                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(circle)
                
                presentedView.center = self.startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: self.duration, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                }, completion: { (success : Bool) in
                    transitionContext.completeTransition(success)
                })
                
            }
        } else {
            
            let transitionModeKey = (self.transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                self.circle.frame = self.frameForCircle(withViewCenter: viewCenter, size: viewSize, andStartPoint: self.startingPoint)
                self.circle.layer.cornerRadius = self.circle.frame.size.height / 2
                
                self.circle.center = self.startingPoint
                
                UIView.animate(withDuration: self.duration, animations: {
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0
                    
                    if self.transitionMode == .pop {
                        containerView.insertSubview(returningView, belowSubview: returningView)
                        containerView.insertSubview(self.circle, belowSubview: returningView)
                    }
                    
                }, completion: { (success : Bool) in
                    returningView.center = self.startingPoint
                    returningView.removeFromSuperview()
                    self.circle.removeFromSuperview()
                    transitionContext.completeTransition(success)
                })
                
            }
            
        }

    }

    func frameForCircle(withViewCenter : CGPoint, size viewSize : CGSize, andStartPoint startPoint : CGPoint) -> CGRect {
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offsetVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offsetVector, height: offsetVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
    
}
