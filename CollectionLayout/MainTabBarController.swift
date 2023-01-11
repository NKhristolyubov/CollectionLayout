//
//  MainTabBarController.swift
//  CollectionLayout
//
//  Created by Nikolai Khristoliubov on 10.01.23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let flowViewController = FlowViewController()
        let compositionalViweController = CompositionalViewController()
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: flowViewController, title: "Flow", image: convImage),
            generateNavigationController(rootViewController: compositionalViweController, title: "Compositional", image: peopleImage)
        ]
    }
    

    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
        
    }

}
