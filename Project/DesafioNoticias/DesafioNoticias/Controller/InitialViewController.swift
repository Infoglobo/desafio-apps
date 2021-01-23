//
//  InitialViewController.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 07/11/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var infoButton : UIButton!
    
    // MARK: - Properties
    let transition = CircularTransition()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoButton.layer.cornerRadius = self.infoButton.frame.size.width / 2
    }
    
    // MARK: - General Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsFeedController = segue.destination as! UINavigationController
        newsFeedController.transitioningDelegate = self
        newsFeedController.modalPresentationStyle = .custom
    }
    
    // MARK: - Actions

}

extension InitialViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transition.transitionMode = .present
        self.transition.startingPoint = self.infoButton.center
        self.transition.circleColor = self.infoButton.backgroundColor!
        
        return self.transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transition.transitionMode = .dismiss
        self.transition.startingPoint = self.infoButton.center
        self.transition.circleColor = self.infoButton.backgroundColor!
        
        return self.transition
    }
    
}
